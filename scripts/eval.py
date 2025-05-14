from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path

from rfstudio.data import MeshViewSynthesisDataset
from rfstudio.engine.task import Task, TaskGroup
from rfstudio.io import load_float32_image
from rfstudio.ui import console


@dataclass
class EvalSB(Task):

    base_dir: Path = Path('IR_outputs')

    def run(self) -> None:
        summary = []
        for scene in ['ball', 'car', 'helmet', 'coffee', 'teapot', 'toaster']:
            dataset = MeshViewSynthesisDataset(Path('..') / 'RadianceFieldStudio' / 'data' / 'refnerf' / scene)
            dataset.__setup__()
            dataset.to(self.device)

            gt_outputs = dataset.get_gt_outputs(split='test')
            psnrs = []
            with console.progress(f'Evaluate {scene}', transient=True) as ptrack:
                load_dir = self.base_dir / f'sb_{scene}' / 'results_brdf'
                for idx, gt in enumerate(ptrack(gt_outputs)):
                    img = load_float32_image(load_dir / f'ngp_stage1_ep0075_{idx:04d}_rgb_brdf.png').to(self.device)
                    gt = gt.blend((1, 1, 1)).item()
                    psnrs.append(((img - gt).square().mean().log10() * -10).item())
            psnr = sum(psnrs) / len(psnrs)
            print(f'PSNR @ {scene}: {psnr:.3f}')
            summary.append(psnr)
        print(f'PSNR @ ALL: {sum(summary) / len(summary):.3f}')

@dataclass
class EvalTSIR(Task):

    base_dir: Path = Path('IR_outputs')

    def run(self) -> None:
        for scene in ['arm', 'ficus', 'hotdog', 'lego']:
            if scene == 'arm':
                path = Path('..') / 'RadianceFieldStudio' / 'data' / 'tensoir' / 'armadillo'
            else:
                path = Path('..') / 'RadianceFieldStudio' / 'data' / 'tensoir' / scene
            dataset = RelightDataset(path)
            dataset.__setup__()
            dataset.to(self.device)

            albedos, roughensses, relights, envmaps = dataset.get_meta(split='test')
            psnrs = []
            for i, envmap in enumerate(envmaps):
                envname = envmap.stem
                load_dir = self.base_dir / f'ir_{scene}' / envname / 'results_brdf'
                with console.progress(f'Evaluate {envname} @ {scene}', transient=True) as ptrack:
                    for idx, gt in enumerate(ptrack(relights[i])):
                        img = load_float32_image(load_dir / f'ngp_stage1_ep0075_{idx:04d}_rgb_brdf.png').to(self.device)
                        gt = gt.blend((1, 1, 1)).item()
                        psnrs.append(((img - gt).square().mean().log10() * -10).item())
            print(f'PSNR @ {scene}: {sum(psnrs) / len(psnrs):.3f}')



if __name__ == '__main__':
    TaskGroup(
        tsir=EvalTSIR(cuda=0),
        sb=EvalSB(cuda=0),
    ).run()
