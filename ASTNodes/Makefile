CC   = clang
CXX  = clang++

DEBUG = -g
CXXSTD = -std=c++11 #-stdlib=libc++
CSTD = -std=c99
CFLAGS = -Wall -O0 $(CSTD) $(DEBUG)
CXXFLAGS = -Wall -O0 $(CXXSTD) $(DEBUG)


TEST=test

CPPOBJ=main NodeAbstract Type DefaultVisitor NodeDumpable 
FILES=$(addsuffix .cpp, $(CPPOBJ))
OBJS=$(addsuffix .o, $(CPPOBJ))


CLEANLIST =  $(OBJS) $(TEST)

.PHONY: all
all:  test

test: $(FILES)
	$(MAKE) $(OBJS)
	$(CXX) $(CXXFLAGS) $(CXXSTD) -o $(TEST) $(OBJS) \

#%.o: %.cpp
#	$(CXX) $(CXXSTD) -c $(CXXFLAGS) -o $@ $<

.PHONY: clean
clean:
	rm -rf $(CLEANLIST)
