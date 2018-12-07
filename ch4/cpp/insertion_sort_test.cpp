#include <algorithm>
#include "gtest/gtest.h"
#include "insertion_sort.h"

TEST(InsertionSort, sort_empty_array) {
    int actual[] = { 1 };
    insertion_sort(std::begin(actual), std::begin(actual), [](int x, int y) { return x - y; });

    auto beginning_of_actual = std::begin(actual);
    auto end_of_actual = std::end(actual);

    ASSERT_EQ(1, std::distance(beginning_of_actual, end_of_actual));
    ASSERT_EQ(1, actual[0]);
}

TEST(InsertionSort, sort_1_element_array) {
    int actual[] = { 1 };
    int expected[] = { 1 };
    insertion_sort(std::begin(actual), std::end(actual), [](int x, int y) { return x - y; });

    auto beginning_of_actual = std::begin(actual);
    auto end_of_actual = std::end(actual);
    auto beginning_of_expected = std::begin(expected);
    auto end_of_expected = std::end(expected);

    ASSERT_EQ(std::distance(beginning_of_expected, end_of_expected), std::distance(beginning_of_actual, end_of_actual));

    for (auto pe = beginning_of_expected, pa = beginning_of_actual; pe < end_of_expected; ++pe, ++pa) {
        ASSERT_EQ(*pe, *pa);
    }
}

TEST(InsertionSort, sort_16_element_array) {
    int actual[] = { 15, 9, 8, 1, 4, 11, 7, 12, 13, 6, 5, 3, 16, 2, 10, 14 };
    int expected[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16 };
    insertion_sort(std::begin(actual), std::end(actual), [](int x, int y) { return x - y; });

    auto beginning_of_actual = std::begin(actual);
    auto end_of_actual = std::end(actual);
    auto beginning_of_expected = std::begin(expected);
    auto end_of_expected = std::end(expected);

    ASSERT_EQ(std::distance(beginning_of_expected, end_of_expected), std::distance(beginning_of_actual, end_of_actual));

    for (auto pe = beginning_of_expected, pa = beginning_of_actual; pe < end_of_expected; ++pe, ++pa) {
        ASSERT_EQ(*pe, *pa);
    }
}

TEST(InsertionSort, sort_string_element_array) {
    std::string actual[] = { "one", "two", "three", "four", "five" };
    std::string expected[] = { "five", "four", "one", "three", "two" };
    insertion_sort(std::begin(actual), std::end(actual), [](const std::string& lhs, const std::string& rhs){ return lhs.compare(rhs); });

    auto beginning_of_actual = std::begin(actual);
    auto end_of_actual = std::end(actual);
    auto beginning_of_expected = std::begin(expected);
    auto end_of_expected = std::end(expected);

    ASSERT_EQ(std::distance(beginning_of_expected, end_of_expected), std::distance(beginning_of_actual, end_of_actual));

    for (auto pe = beginning_of_expected, pa = beginning_of_actual; pe < end_of_expected; ++pe, ++pa) {
        ASSERT_EQ(*pe, *pa);
    }
}
