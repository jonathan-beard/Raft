CC   = clang
CXX  = clang++

ifeq ($(shell uname -s), Darwin)
DARWIN = -stdlib=libc++
else
DARWIN = 
endif
ASTDIR   = ./ASTNodes/
DEBUG    = -g
CXXSTD   = -std=c++11 $(DARWIN)
CSTD     = -std=c99
CFLAGS   = -Wall -O0 $(CSTD) $(DEBUG)
CXXFLAGS = -Wall -O0 -I. -I$(ASTDIR) $(CXXSTD) $(DEBUG)

NODES    =  NodeAbstract Type NodeDumpable BooleanType Declaration \
				Float32Type Float64Type Float96Type FloatType Initializer \
				Int16Type Int32Type Int64Type Int8Type IntType ObjectType \
				StringType TemplateDeclaration TypeModifier UInt16Type \
				UInt32Type UInt64Type UInt8Type UIntType VectorType \
            Port

VISITORS = DefaultVisitor DebugVisitor
				
ASTNODES = $(addprefix $(ASTDIR), $(NODES))            
ASTVISITORS = $(addprefix $(ASTDIR), $(VISITORS))

ASTCPPFILES = $(addsuffix .cpp, $(ASTNODES))
VISITORCPPFILES = $(addsuffix .cpp, $(ASTVISITORS))

ASTNODEOBJS = $(addsuffix .o,   $(ASTNODES))
ASTVISITOROBJS = $(addsuffix .o, $(ASTVISITORS))

ASTOBJS = $(ASTNODEOBJS) $(ASTVISITOROBJS) 

ASTCLEAN =  $(ASTOBJS)

nodes: $(ASTCPPFILES)
	$(MAKE) $(ASTNODEOBJS)

visitors: $(VISITORCPPFILES)
	$(MAKE) $(ASTVISITOROBJS)

#testast: $(ASTCPPFILES)
#	$(MAKE) $(ASTOBJS)
#	$(CXX) $(CXXFLAGS) $(CXXSTD) -o TESTAST $(OBJS)
