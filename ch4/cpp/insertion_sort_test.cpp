#include <iostream>
#include <algorithm>
#include <iterator>
#include <string>

#include "insertion_sort.h"

void sort_integers() {
    int ary[] = { 15, 9, 8, 1, 4, 11, 7, 12, 13, 6, 5, 3, 16, 2, 10, 14 };

    std::copy(std::begin(ary), std::end(ary), std::ostream_iterator<int>(std::cout, " "));
    std::cout << "\n";

    insertion_sort(std::begin(ary), std::end(ary), [](int lhs, int rhs){ return lhs - rhs; });

    std::copy(std::begin(ary), std::end(ary), std::ostream_iterator<int>(std::cout, " "));
    std::cout << std::endl;
}

void sort_strings() {
    std::string ary[] = { "one", "two", "three", "four", "five" };

    std::copy(std::begin(ary), std::end(ary), std::ostream_iterator<std::string>(std::cout, " "));
    std::cout << "\n";

    insertion_sort(std::begin(ary), std::end(ary), [](const std::string& lhs, const std::string& rhs){ return lhs.compare(rhs); });

    std::copy(std::begin(ary), std::end(ary), std::ostream_iterator<std::string>(std::cout, " "));
    std::cout << std::endl;
}

int main(int, char* []) {
    sort_integers();
    sort_strings();

    return 0;
}
