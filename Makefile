Subdirs = 1_SampleGeneration 2_JointLikelihoodFit 3_FittingTests 4_FitBiasCorrection Visualisation FitQuality AmplitudeModel
VPATH = 1_SampleGeneration:2_JointLikelihoodFit:3_FittingTests:4_FitBiasCorrection:Visualisation:FitQuality:AmplitudeModel
Exclude = bin/buildResonanceModel_BaBar.o bin/buildResonanceModel_old.o
Sources = $(foreach sdir, $(Subdirs), $(wildcard $(sdir)/*.cpp))
Objects_src = $(wildcard b2d0d0bk_model/*.cpp)
Objects_name = $(basename $(notdir $(Objects_src)))
Objects = $(filter-out $(Exclude), $(addsuffix .o, $(addprefix bin/,$(Objects_name))))
Executable = $(basename $(notdir $(Sources)))
Executable_path = $(addprefix bin/,$(Executable))


ROOTFLAGS = $(shell root-config --cflags)
ROOTLIBS  = $(shell root-config --libs)

# g++ compiler flags
CFLAGS = $(ROOTFLAGS) -fopenmp

# Setting Laura flags - Set Laura library and include path here
ifeq ($(LAURALIBDIR),)
LAURAINCDIR = # Path to Laura++ include directoryy here
endif

ifeq ($(LAURALIBDIR),)
LAURALIBDIR = # Path to Laura++ library directory
endif

# libraries
LAURALIB = -lLaura++

# setting up include and library flags
INCLUDES = -I$(LAURAINCDIR) -Ib2d0d0bk_model -IresonInfo -ImodelUtilities
LIBDIRS = -L$(LAURALIBDIR) -Wl,-rpath,$(LAURALIBDIR)
LIBS = $(LAURALIB)

all : $(Objects) | $(Executable_path)

bin/%.o : b2d0d0bk_model/%.cpp
	g++ $(CFLAGS) -c $< -o $@ $(ROOTLIBS) $(INCLUDES) $(LIBDIRS) $(LIBS)

bin/% : %.cpp
	g++ $(CFLAGS) $< -o $@ $(Objects) $(ROOTLIBS) $(INCLUDES) $(LIBDIRS) $(LIBS)
	
clean:
	rm bin/*
#rm bin/* && ./clearOutput.sh