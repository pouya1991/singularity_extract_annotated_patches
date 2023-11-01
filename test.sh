#!/bin/bash
#SBATCH --job-name test
#SBATCH --cpus-per-task 6
#SBATCH --output /projects/ovcare/classification/cchen/ml/slurm/test.%j.out
#SBATCH --error  /projects/ovcare/classification/cchen/ml/slurm/test.%j.out
#SBATCH -w {w}
#SBATCH -p {p}
#SBATCH --gres=gpu:1
#SBATCH --time=3-00:00:00
#SBATCH --chdir /projects/ovcare/classification/cchen/ml/singularity_extract_annotated_patches
#SBATCH --mem=30G

PATH="{$PATH}:/opt/singularity-3.4.0/bin"
cd /projects/ovcare/classification/cchen/ml/singularity_extract_annotated_patches
source /projects/ovcare/classification/cchen/{pyenv}

mkdir -p extract_annotated_patches/tests/outputs
mkdir -p extract_annotated_patches/tests/mock/patches
# pytest -s -vv extract_annotated_patches/tests/test_extract.py::test_extract_1
pytest --durations=0 -s -vv extract_annotated_patches/tests/test_run.py::test_from_arguments_use_directory_annotation_2
# pytest --durations=0 -s -vv extract_annotated_patches/tests/test_run.py::test_from_arguments_use_directory_annotation_3
# pytest -s -vv extract_annotated_patches/tests/test_auxiliary.py
# pytest --durations=0 -s -vv extract_annotated_patches/tests/test_extract.py
# pytest --durations=0 -s -vv extract_annotated_patches/tests/test_run.py
# pytest -s -vv extract_annotated_patches/tests/

