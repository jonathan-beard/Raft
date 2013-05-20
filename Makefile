CC    = clang
CXX   = clang++

DEBUG = -g
CFLAGS = -Wall -O0  $(DEBUG)
CXXFLAGS = -Wall -O0 $(DEBUG)
CSTD = -std=c99
CXXSTD = -std=c++11

APCOMEXE = apcom
APHEXE = aph

APCOMCPPOBJ = apmain ap_data app ap_prep ap_options_vars \
				  command_arguments ap_set_options ap_driver \
				  ap_common
APCOMSOBJ =  ap_parser ap_lexer
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
				 $(APCOMOBJS) test\
				 ap_parser.tab.cc ap_parser.tab.hh \
				 location.hh position.hh \
			    stack.hh ap_parser.output \
				 ap_lexer.yy.cc aph_lexer.yy.cc $(EXE)\

.PHONY: all
all:  apcom

apcom: $(APCOMFILES)
	$(MAKE) $(APCOMSOBJ)
	$(MAKE) $(APCOMOBJS)
	$(CXX) $(CXXFLAGS) $(CXXSTD) -o test $(APCOMOBJS) \
	$(APCOMSOBJS) $(LIBS)

aph: $(APHFILES)
	$(MAKE) $(APHSOBJ)
	$(MAKE) $(APHOBJS)
	$(CXX) $(CXXFLAGS) $(CXXSTD) -o $(APHEXE) $(APHOBJS) \
	aph_parser.o aph_lexer.o $(LIBS)

ap_parser: ap_parser.yy
	bison -d -v ap_parser.yy
	$(CXX) $(CXXSTD) $(CXXFLAGS) -c -o ap_parser.o ap_parser.tab.cc

ap_lexer: ap_lexer.l
	flex --outfile=ap_lexer.yy.cc $<
	$(CXX) $(CXXSTD) $(CXXFLAGS) -c ap_lexer.yy.cc -o ap_lexer.o

aph_parser: aph_parser.yy
	bison -d -v aph_parser.yy
	$(CXX) $(CXXSTD) $(CXXFLAGS) -c -o aph_parser.o aph_parser.tab.cc

aph_lexer: aph_lexer.l
	flex --outfile=aph_lexer.yy.cc $<
	$(CXX) $(CXXSTD) $(CXXFLAGS) -c aph_lexer.yy.cc -o aph_lexer.o

%.o: %.cpp
	$(CXX) $(CXXSTD) -c $(CXXFLAGS) $(CXXSTD) -o $@ $<

.PHONY: clean
clean:
	rm -rf $(CLEANLIST)
