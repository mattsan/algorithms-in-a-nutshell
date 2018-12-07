GTEST_DIR = ../../googletest/googletest
CFLAGS = -std=c++11 -isystem $(GTEST_DIR)/include -pthread
ENTRYPOINT = $(GTEST_DIR)/src/gtest_main.cc
LIBS = libgtest.a

all: insertion_sort_test heap_sort_test
	./insertion_sort_test
	./heap_sort_test

insertion_sort_test: insertion_sort_test.cpp insertion_sort.h
	g++ $(CFLAGS) insertion_sort_test.cpp $(ENTRYPOINT) $(LIBS) -o $@

heap_sort_test: heap_sort_test.cpp heap_sort.cpp heap_sort.h
	g++ $(CFLAGS) heap_sort_test.cpp heap_sort.cpp $(ENTRYPOINT) $(LIBS) -o $@

libgtest.a:
	g++ -std=c++11 -isystem $(GTEST_DIR)/include -I$(GTEST_DIR) -pthread -c $(GTEST_DIR)/src/gtest-all.cc
	ar -rv libgtest.a gtest-all.o

clean:
	rm -f *.o
	rm -f *_test
