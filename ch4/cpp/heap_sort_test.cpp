#include <iostream>
#include <algorithm>
#include <iterator>
#include "heap_sort.h"

int main(int, char* []) {
    int array1[] = { 8, 11, 9, 2, 10, 16 };
    heap_sort(array1, std::distance(std::begin(array1), std::end(array1)));

    std::copy(std::begin(array1), std::end(array1), std::ostream_iterator<int>(std::cout, " "));
    std::cout << std::endl;

    return 0;
}
