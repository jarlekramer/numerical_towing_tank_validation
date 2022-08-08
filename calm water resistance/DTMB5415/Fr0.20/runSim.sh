#!/bin/bash

setFields

decomposePar
mpirun -np 28 interFoam -parallel
reconstructPar
rm -fr processor*
