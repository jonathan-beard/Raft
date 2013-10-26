CC   = gcc
CXX  = g++

ifeq ($(shell uname -s),Darwin)
DARWIN = -stdlib=libc++
else
DARWIN = 
endif

include ./Visitors/Makefile
include ./ASTNodes/Makefile

DEBUG = -g
CFLAGS = -Wall -O0  $(DEBUG)
CXXFLAGS = -Wall -O0 -I$(ASTDIR) -I$(VISITORDIR) -I. $(DEBUG)
CSTD = -std=c99
CXXSTD = -std=c++11 $(DARWIN)


APCOMEXE = raft
APHEXE = raft_h


APCOMCPPOBJ = main data p prep options_vars \
				  command_arguments set_options driver \
				  common command_option_base \
              cpp_output_handler

APCOMSOBJ =  raft_parser raft_lexer
APCOMSOBJS = $(addsuffix .o, $(APCOMSOBJ) )
APCOMLIBS = 
APCOMFILES = $(addsuffix .cpp, $(APCOMCPPOBJ))
APCOMOBJS  = $(addsuffix .o, $(APCOMCPPOBJ))

APHCPPOBJ = aphmain
APHSOBJ = aph_parser aph_lexer
APHLIBS = 
APHFILES = $(addsuffix .cpp, $(APHCPPOBJ))
APHOBJS = $(addsuffix .o, $(APHCPPOBJ))


CLEANLIST =  $(addsuffix .o, $(OBJ)) $(OBJS) \
             $(APCOMSOBJS)\
             $(addsuffix .o, $(APHSOBJ) )    \
				 $(APCOMOBJS)\
				 raft_parser.tab.cc raft_parser.tab.hh \
				 location.hh position.hh \
			    stack.hh raft_parser.output \
				 raft_lexer.yy.cc rafth_lexer.yy.cc $(APCOMEXE)\

.PHONY: all
all:  raft

raft: $(APCOMFILES)
	$(MAKE) nodes
	$(MAKE) visitors
	$(MAKE) $(APCOMSOBJ)
	$(MAKE) $(APCOMOBJS)
	$(CXX) $(CXXFLAGS) $(CXXSTD) -o $(APCOMEXE) $(APCOMOBJS) \
	$(APCOMSOBJS) $(ASTNODEOBJS) $(VISITOROBJS) $(LIBS)

rafth: $(APHFILES)
	$(MAKE) $(APHSOBJ)
	$(MAKE) $(APHOBJS)
	$(CXX) $(CXXFLAGS) $(CXXSTD) -o $(APHEXE) $(APHOBJS) \
	rafth_parser.o rafth_lexer.o $(LIBS)

raft_parser: raft_parser.yy
	bison -d -v raft_parser.yy
	$(CXX) $(CXXSTD) $(CXXFLAGS) -c -o raft_parser.o raft_parser.tab.cc

raft_lexer: raft_lexer.l
	flex --outfile=raft_lexer.yy.cc $<
	$(CXX) $(CXXSTD) $(CXXFLAGS) -c raft_lexer.yy.cc -o raft_lexer.o

rafth_parser: rafth_parser.yy
	bison -d -v rafth_parser.yy
	$(CXX) $(CXXSTD) $(CXXFLAGS) -c -o rafth_parser.o rafth_parser.tab.cc

rafth_lexer: rafth_lexer.l
	flex --outfile=rafth_lexer.yy.cc $<
	$(CXX) $(CXXSTD) $(CXXFLAGS) -c rafth_lexer.yy.cc -o rafth_lexer.o

%.o: %.cpp
	$(CXX) $(CXXSTD) -c $(CXXFLAGS) $(CXXSTD) -o $@ $<

.PHONY: clean
clean:
	rm -rf $(CLEANLIST) $(ASTCLEAN) $(VISITORCLEAN)
