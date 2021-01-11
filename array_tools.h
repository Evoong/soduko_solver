// SEASHELL_READONLY

#define MAX_LEN 100

// array_read(arr, max_len) reads up to max_len values from the console and
//   stores them in arr. The function returns the number of read values.
// requires: max_len must be positive
// effects: reads output
//          modifies data
// time:    O(n)
int array_read(int *arr, const int max_len);

// array_print(arr, arr_len) prints arr (with a length of arr_len)
// requires: arr_len must be non-negative
// effects:  produces output
// time:     O(n)
void array_print(const int *arr, const int arr_len);
