// =======================================================
// Eric Voong (20778118)
// CS 136 Fall 2020
// Assignment 07, Problem 3
// =======================================================


#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include "sudoku.h"
#include "array_tools.h"
#include "merge_sort.h"

// DIM is the dimension of the Sudoku board
#define DIM 9

// DIMBOX is the dimension of a box
static const int DIMBOX = 3;
// EMPTY is the code for an empty cell
static const int EMPTY = 0;
// PRINT holds the characters for printing out the Sudoku board
static const char PRINT[] = { '_', '1', '2', '3', '4', '5', '6', '7', '8', '9' };
// SUCCESS indicates the successful execution of a function
static const int SUCCESS = 0;
// CONSTRAINT_VIOLATED indicates that a row-, column, or box-constraint is
//   violated
static const int CONSTRAINT_VIOLATED = -1;


struct sudoku {
  // puzzle contains the start state of the puzzle
  int puzzle[DIM * DIM];
  // solution contains is equal to puzzle at the beginning and then stores
  //   all numbers filled in by the player.
  int solution[DIM * DIM];
};

// === HELPER FUNCTIONS =======================================================

// same_row(su, row , num); takes a number and see if it is a valid solution 
//   base on row constraints
// requires: row are valid indices. 
//           num is an integer between 1 and 9.
// time: O(n)
bool same_row(const struct sudoku *su, int row, int num){
  assert(su);
  assert(0 <= row && row <= DIM - 1);
  assert(1 <= num && num <= DIM);
  for (int c = 0; c < DIM; c ++){
    if (num == su->solution[row * DIM + c]){
      return CONSTRAINT_VIOLATED;
    }
  }
  return SUCCESS;
}

// same_col(su, col , num); takes a number and see if it is a valid solution 
//   base on column constraints
// requires: col are valid indices. 
//           num is an integer between 1 and 9.
// time: O(n)
bool same_col(const struct sudoku *su, int col, int num){
  assert(su);
  assert(0 <= col && col <= DIM - 1);
  assert(1 <= num && num <= DIM);
  for (int r = 0 ; r <  DIM; r++){
    if (num == su->solution[r * DIM + col]){
      return CONSTRAINT_VIOLATED;
    }
  }
  return SUCCESS;
}

// same_box(su, row, col, num); takes a number and see if it is a valid 
//   solution base on box constraints
// requires: row are valid indices. 
//           col are valid indices. 
//           num is an integer between 1 and 9.
// time: O(n^2)
bool same_box(const struct sudoku *su, int row, int col, int num){
  assert(su);
  assert(0 <= row && row <= DIM - 1);
  assert(0 <= col && col <= DIM - 1);
  assert(1 <= num && num <= DIM);
  if (row < 3){
    row = 0;
  } else if (row < 6){
    row = 3;
  } else if (row  < 9){
    row = 6;
  }

  if (col < 3){
    col = 0;
  } else if (col < 6){
    col = 3;
  } else if (col  < 9){
    col = 6;
  }

  for (int r = row; r < row + DIMBOX ; ++r){
    for (int c = col; c < col + DIMBOX; ++c){
      if (su->solution[r * DIM + c] == num){
        return CONSTRAINT_VIOLATED;
      }
    }
  }
  return SUCCESS;
}

// === MAIN FUNCTIONS =======================================================

// see sudoku.h for documentation
struct sudoku *sudoku_read(void) {
  struct sudoku *su = malloc(sizeof(struct sudoku));
  assert(su);
  int *pPuz = su->puzzle, *pSol = su->solution;
  for (int cnt = 0; cnt < DIM * DIM; ++cnt, ++pPuz, ++pSol) {
    char c = '\0';
    assert(scanf(" %c", &c) == 1);
    *pPuz = *pSol = (c == PRINT[EMPTY]) ? 0 : c - '0';
  }
  return su;
}

// see sudoku.h for documentation
void sudoku_destroy(struct sudoku *su) {
  assert(su);
  free(su);
}

// solution_print_separator() prints out a separator between boxes.
// produces output
static void solution_print_separator(void) {
  for (int box = 0; box < DIM / DIMBOX; ++box) {
    printf("+");
    for (int i = 0; i < 3 * DIMBOX; ++i) {
      printf("-");
    }
  }
  printf("+\n");
}

// see sudoku.h for documentation
void solution_print(const struct sudoku *su) {
  assert(su);

  for (int r = 0; r < DIM; ++r) {
    if (r % DIMBOX == 0) {
      solution_print_separator();
    }
    for (int c = 0; c < DIM; ++c) {
      if (c % DIMBOX == 0) {
        printf("|");
      }
      printf(" %c ", PRINT[su->solution[r * DIM + c]]);
    }
    printf("|\n");
  }
  solution_print_separator();
  printf("\n");
}

// see sudoku.h for documentation
void solution_reset(struct sudoku *su) {
  assert(su);
  for (int row = 0; row < DIM; ++row) {
    for (int col = 0; col < DIM; ++col) {
      su->solution[row * DIM + col] = su->puzzle[row * DIM + col];
    }
  }  
}

// see sudoku.h for documentation
bool cell_erase(struct sudoku *su, int row, int col) {
  assert(su);
  assert(0 <= row && row <= DIM - 1);
  assert(0 <= col && col <= DIM - 1);

  if (su->puzzle[row * DIM + col] != EMPTY) {
    return false;
  } else {
    su->solution[row * DIM + col] = EMPTY;
    return true;
  }
}

// see sudoku.h for documentation
bool cell_fill(struct sudoku *su, int row, int col, int num) {
  // your implementation goes here
  assert(su);
  assert(0 <= row && row <= DIM - 1);
  assert(0 <= col && col <= DIM - 1);
  assert(1 <= num && num <= DIM);

  if (su->solution[row * DIM + col] != EMPTY || same_row(su, row, num) ||
      same_col(su, col, num) || same_box(su, row, col, num)) {
    return false;
  } else {
    su->solution[row * DIM + col] = num;
    return true;
  }
}

// see sudoku.h for documentation
bool puzzle_solved(const struct sudoku *su) {
  assert(su);
  // row check
  for (int row = 0; row < DIM; row++){
    for (int i = 1; i <= DIM; i++){
      if (same_row(su, row, i) == false){
        return false;
      }
    }
  }
  // column check
  for (int col = 0; col < DIM; col++){
    for (int i = 1; i <= DIM; i++){
      if (same_col(su, col, i) == false){
        return false;
      }
    }
  }

  // same box check
  for (int row = 0; row < DIMBOX ; row++){
    for (int col = 0; col < DIMBOX; col++){
      for (int i = 1; i <= DIM; i++){
        if (same_box(su, row * DIMBOX, col * DIMBOX, i) == false){
          return false;
        }
      }
    }
  }
  return true;
}

// see sudoku.h for documentation
int cell_choices(const struct sudoku *su, int row, int col, int choices[]) {
  assert(su);
  assert(0 <= row && row <= DIM - 1);
  assert(0 <= col && col <= DIM - 1);
  assert(choices);

  int counter = 0;
  for (int i = 1; i <= DIM; ++i){
    if (!same_row(su, row, i) && !same_col(su, col, i) && 
        !same_box(su, row, col, i)){
      choices[counter] = i;
      ++counter;
    }
  }
  return counter;
}

// see sudoku.h for documentation
bool cell_hint(const struct sudoku *su, int *row, int *col) {
  assert(su);
  assert(row);
  assert(col);
  int choice[DIM] = {};
  for (int r = 0; r < DIM; ++r){
    for (int c = 0; c < DIM; ++c){
      if (su->solution[r * DIM + c] == EMPTY &&
          cell_choices(su, r, c, choice) == 1){
        *row = r;
        *col = c;
        return true;
      }
    }
  }
  return false;
}

// see sudoku.h for documentation
int find_empty_cell(const struct sudoku *su, int *row, int *col){
  assert(su);
  assert(row);
  assert(col);
  int choice[DIM] = {};
  int sol = 0;
  int least_choices = 9;
  for (int r = 0; r < DIM; ++r){
    for (int c = 0; c < DIM; ++c){
      if (su->solution[r * DIM + c] == EMPTY){
        sol = cell_choices(su, r, c, choice);
        if (sol == 1){
          *row = r;
          *col = c;
          return sol;
        }
        else if (sol > 1 && sol < least_choices){
          least_choices = sol;
          *row = r;
          *col = c;
        }
      }
    }
  }
  return least_choices;
}

// see sudoku.h for documentation
bool sudoku_solve(struct sudoku *su) {
  assert(su);
  int row = 0;
  int col = 0;
  int choices[DIM] = {};

  if (puzzle_solved(su)){
    return true;
  }
  else {
    int sol = find_empty_cell(su, &row, &col);
    if (sol ==  0){
      return false;
    }
    else{
      int choice_len = cell_choices(su, row, col, choices); 
      for (int i = 0; i < choice_len; i++){
        cell_fill(su, row, col, choices[i]);

        if (sudoku_solve(su)){
          return true;
        }
      }
      if (!puzzle_solved(su)){
        solution_reset(su);
        return false;
      }
    }
  }
  return false;
}