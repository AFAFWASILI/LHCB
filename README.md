### Introduction

This is a toy study to quantify the effects on errors of including double CP-tagged $D^{0}\bar{D}^{0}$ systems in the amplitude analysis of $B^{+} \rightarrow D^{0}\bar{D}^{0}K^{+}$ decays. See [arXiv:2102.07729](https://arxiv.org/abs/2102.07729) for more details.


### Setup
#### Dependencies and Environment Variables
In the makefile, ```LAURALIBDIR``` and ```LAURAINCDIR``` must be set to the ```include/Laura++``` and ```lib64``` directories within the Laura install path before the project can be compiled. Alternatively, one can set ```$LAURALIBDIR``` and ```$LAURAINCDIR``` to the required paths as environment variables as I have done (useful when working with multiple computers)


#### Directory Structure
Ensure that the working directory has the structure below before attempting to compile and run
```
├── 1_SampleGeneration
├── 2_JointLikelihoodFit
├── b2d0d0bk_model
├── bin
└── output
    ├── Gen
    │   ├── QC
    │   └── UC
    ├── JointFit
    │   ├── Coordinator
    │   ├── QC
    │   ├── Results
    │   └── UC
    └── Results
```