#ifndef INSERTION_SORT_H
#define INSERTION_SORT_H

template<typename T, typename F>
void insertion_sort(T* begin, T* end, F cmp) {
    for (T* q = begin + 1; q < end; ++q) {
        T* p = q - 1;
        T value = *q;
        while (p >= begin && cmp(*p, value) > 0) {
            p[1] = p[0];
            --p;
        }
        p[1] = value;
    }
}

#endif//INSERTION_SORT_H
