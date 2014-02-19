VISITORDIR   = ./Visitors/

VISITORS = DefaultVisitor DebugVisitor SymtabVisitor Reflect

ASTVISITORS = $(addprefix $(VISITORDIR), $(VISITORS))

VISITORCPPFILES = $(addsuffix .cpp, $(ASTVISITORS))

VISITOROBJS = $(addsuffix .o, $(ASTVISITORS))

VISITORCLEAN =  $(VISITOROBJS)

visitors: $(VISITORCPPFILES) $(VISITOROBJS)
	$(MAKE) $(VISITOROBJS)
