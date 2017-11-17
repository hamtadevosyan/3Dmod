CC = g++
C_FLAGS = -g -pg -c -DMOCK -std=c++11
PGM = 3DMod
INCLUDES = -I$(CURDIR)/include -I/usr/include/eigen3/
LIBS = -L/usr/lib64 -lboost_filesystem -lboost_system -lboost_program_options -lpthread -lopencv_core -lopencv_sfm -lopencv_viz

all: $(PGM)

$(PGM): 3DMod.o
	$(CC) -pg $(INCLUDES) 3DMod.o -o $(PGM) $(LIBS)

3DMod.o: src/main.cpp
	$(CC) $(C_FLAGS) $(INCLUDES) src/main.cpp $(LIBS)

clean:
	@-rm *.o $(PGM)
