#!/bin/bash

surfaceFeatureExtract
blockMesh
mv system/decomposeParDict system/decomposeParDict.sim
mv system/decomposeParDict.mesh system/decomposeParDict
decomposePar
mv system/fvOptions system/fvOptions.sim
mpirun -np 28 snappyHexMesh -overwrite -parallel
reconstructParMesh -constant
rm -fr processor*
mv system/decomposeParDict system/decomposeParDict.mesh
mv system/decomposeParDict.sim system/decomposeParDict
renumberMesh -overwrite
mv system/fvOptions.sim system/fvOptions
