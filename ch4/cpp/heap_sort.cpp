#include <algorithm>

#include "heap_sort.h"

namespace {

void heapify(int* array, int idx, int max) {
    int largest = idx;
    int left = 2 * idx + 1;
    int right = 2 * idx + 2;

    if (left < max && array[left] > array[idx]) { largest = left; }
    if (right < max && array[right] > array[largest]) { largest = right; }

    if (largest != idx) {
        std::swap(array[idx], array[largest]);
        heapify(array, largest, max);
    }
}

void build_heap(int* array, int size) {
    for (int i = size / 2 + 1; i >= 0; --i) {
        heapify(array, i, size);
    }
}

} // namespace

void heap_sort(int* array, int size) {
    build_heap(array, size);

    for (int i = size - 1; i >= 1; --i) {
        std::swap(array[0], array[i]);
        heapify(array, 0, i);
    }
}
