#include "gtest/gtest.h"
#include "heap_sort.h"

TEST(HeapSort, sort_6_element_array) {
    int actual[] = { 8, 11, 9, 2, 10, 16 };
    int expected[] = { 2, 8, 9, 10, 11, 16 };

    heap_sort(actual, std::distance(std::begin(actual), std::end(actual)));

    for (auto pe = std::begin(expected), pa = std::begin(actual); pe < std::end(expected); ++pe, ++pa) {
        ASSERT_EQ(*pe, *pa);
    }
}
