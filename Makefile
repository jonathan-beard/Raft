CC    = clang
CXX   = clang++

CFLAGS = -Wall -O0  #$(CDEBUG)
CSTD = -std=c99
CXXSTD = -std=c++11

APCOMEXE = apcom
APHEXE = aph

APCOMCPPOBJ = apmain
APCOMSOBJ =  ap_parser ap_lexer
APCOMLIBS = 
APCOMFILES = $(addsuffix .cpp, $(APCOMCPPOBJ))
APCOMOBJS  = $(addsuffix .o, $(APCOMCPPOBJ))

APHCPPOBJ = aphmain
APHSOBJ = aph_parser aph_lexer
APHLIBS = 
APHFILES = $(addsuffix .cpp, $(APHCPPOBJ))
APHOBJS = $(addsuffix .o, $(APHCPPOBJ))


CLEANLIST =  $(addsuffix .o, $(OBJ)) $(OBJS) \
				 ap_parser.tab.cc ap_parser.tab.hh \
				 location.hh position.hh \
			    stack.hh ap_parser.output ap_parser.o \
				 ap_lexer.o aph_parser.o aph_lexer.o \
				 ap_lexer.yy.cc aph_lexer.yy.cc $(EXE)\

.PHONY: all
all: aph apcom

apcom: $(APCOMFILES)
	$(MAKE) $(APCOMSOBJ)
	$(MAKE) $(APCOMOBJS)
	$(CXX) $(CXXFLAGS) $(CXXSTD) -o $(APCOMEXE) $(APCOMOBJS) \
	ap_parser.o ap_lexer.o $(LIBS)

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
	$(CXX) $(CXXSTD) $(CXXFLAGS) -c ap_lexer.yy.cc -o lexer.o

aph_parser: aph_parser.yy
	bison -d -v aph_parser.yy
	$(CXX) $(CXXSTD) $(CXXFLAGS) -c -o aph_parser.o aph_parser.tab.cc

aph_lexer: aph_lexer.l
	flex --outfile=aph_lexer.yy.cc $<
	$(CXX) $(CXXSTD) $(CXXFLAGS) -c aph_lexer.yy.cc -o lexer.o

%.o: %.cpp
	$(CXX) $(CXXSTD) -c $(CXXFLAGS) $(CXXSTD) -o $@ $<

.PHONY: clean
clean:
	rm -rf $(CLEANLIST)

