#!/bin/bash
git clone https://github.com/pyiron/pyiron_contrib "$HOME"/pyiron_contrib/
cd "$HOME"/pyiron_contrib/
git checkout FEniCS_job
pip install --no-deps .
cp "$HOME"/pyiron_contrib/notebooks/fenics_tutorial.ipynb "$HOME"/
cd ..
rm -r "$HOME"/pyiron_contrib
rm "$HOME"/*.yml
rm "$HOME"/Dockerfile
rm "$HOME"/*.sh
