# Challenge name: Valid Sudoku

# Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:
# Each row must contain the digits 1-9 without repetition.
# Each column must contain the digits 1-9 without repetition.
# Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.

# @param {Character[][]} board
# @return {Boolean}

#
# Approach 1: Hash & Brute Force
#
def is_valid_sudoku(board)
  rows = []
  columns = []
  grids = []

  # make each row into a hash to track for duplicated values
  board.each do |row|
    row_hash = Hash.new(0)
    row.each do |num|
      next if num == '.'

      row_hash[num] += 1
    end
    rows << row_hash
  end

  # check each row hash for duplicated value
  rows.each do |row|
    row.each do |_k, v|
      return false if v > 1
    end
  end

  # make each column into a hash to track for duplicated values
  (0..8).each do |i|
    column_hash = Hash.new(0)
    board.each do |row|
      next if row[i] == '.'

      column_hash[row[i]] += 1
      columns << column_hash
    end
  end

  # check each column hash for duplicated value
  columns.each do |column|
    column.each do |_k, v|
      return false if v > 1
    end
  end

  # make each 3x3 grid into a hash to track for duplicated values
  (0..2).each do |i|
    grid_hash = Hash.new(0)
    board.first(3).each do |row|
      next if row[i] == '.'

      grid_hash[row[i]] += 1
      grids << grid_hash
    end
    board[3..5].each do |row|
      next if row[i] == '.'

      grid_hash[row[i]] += 1
      grids << grid_hash
    end
    board.each do |row|
      next if row[i] == '.'

      grid_hash[row[i]] += 1
      grids << grid_hash
    end
  end
  (3..5).each do |i|
    grid_hash = Hash.new(0)
    board.first(3).each do |row|
      next if row[i] == '.'

      grid_hash[row[i]] += 1
      grids << grid_hash
    end
    board[3..5].each do |row|
      next if row[i] == '.'

      grid_hash[row[i]] += 1
      grids << grid_hash
    end
    board.each do |row|
      next if row[i] == '.'

      grid_hash[row[i]] += 1
      grids << grid_hash
    end
  end
  (6..8).last(3).each do |i|
    grid_hash = Hash.new(0)
    board.first(3).each do |row|
      next if row[i] == '.'

      grid_hash[row[i]] += 1
      grids << grid_hash
    end
    board[3..5].each do |row|
      next if row[i] == '.'

      grid_hash[row[i]] += 1
      grids << grid_hash
    end
    board.each do |row|
      next if row[i] == '.'

      grid_hash[row[i]] += 1
      grids << grid_hash
    end
  end

  # check each grid hash for duplicated value
  grids.each do |grid|
    grid.each do |_k, v|
      return false if v > 1
    end
  end

  true
end

board = [['5', '3', '.', '.', '7', '.', '.', '.', '.'],
         ['6', '.', '.', '1', '9', '5', '.', '.', '.'],
         ['.', '9', '8', '.', '.', '.', '.', '6', '.'],
         ['8', '.', '.', '.', '6', '.', '.', '.', '3'],
         ['4', '.', '.', '8', '.', '3', '.', '.', '1'],
         ['7', '.', '.', '.', '2', '.', '.', '.', '6'],
         ['.', '6', '.', '.', '.', '.', '2', '8', '.'],
         ['.', '.', '.', '4', '1', '9', '.', '.', '5'],
         ['.', '.', '.', '.', '8', '.', '.', '7', '9']]
print(is_valid_sudoku(board))
# => true

board = [['8', '3', '.', '.', '7', '.', '.', '.', '.'],
         ['6', '.', '.', '1', '9', '5', '.', '.', '.'],
         ['.', '9', '8', '.', '.', '.', '.', '6', '.'],
         ['8', '.', '.', '.', '6', '.', '.', '.', '3'],
         ['4', '.', '.', '8', '.', '3', '.', '.', '1'],
         ['7', '.', '.', '.', '2', '.', '.', '.', '6'],
         ['.', '6', '.', '.', '.', '.', '2', '8', '.'],
         ['.', '.', '.', '4', '1', '9', '.', '.', '5'],
         ['.', '.', '.', '.', '8', '.', '.', '7', '9']]
print(is_valid_sudoku(board))
# => false
# explanation: duplicated value in column

board = [['8', '3', '.', '.', '7', '.', '3', '.', '.'],
         ['6', '.', '.', '1', '9', '5', '.', '.', '.'],
         ['.', '9', '8', '.', '.', '.', '.', '6', '.'],
         ['8', '.', '.', '.', '6', '.', '.', '.', '3'],
         ['4', '.', '.', '8', '.', '3', '.', '.', '1'],
         ['7', '.', '.', '.', '2', '.', '.', '.', '6'],
         ['.', '6', '.', '.', '.', '.', '2', '8', '.'],
         ['.', '.', '.', '4', '1', '9', '.', '.', '5'],
         ['.', '.', '.', '.', '8', '.', '.', '7', '9']]
print(is_valid_sudoku(board))
# => false
# explanation: duplicated value in row

board = [['8', '3', '.', '.', '7', '.', '.', '.', '.'],
         ['6', '.', '.', '1', '9', '5', '.', '.', '.'],
         ['.', '9', '8', '.', '.', '.', '.', '6', '.'],
         ['.', '.', '.', '.', '6', '.', '.', '.', '3'],
         ['4', '.', '.', '8', '.', '3', '.', '.', '1'],
         ['7', '.', '.', '.', '2', '.', '.', '.', '6'],
         ['.', '6', '.', '.', '.', '.', '2', '8', '.'],
         ['.', '.', '.', '4', '1', '9', '.', '.', '5'],
         ['.', '.', '.', '.', '8', '.', '.', '7', '9']]
print(is_valid_sudoku(board))
# => false
# explanation: duplicated value in 3x3 grid

#
# Approach 2: Sets
#
require 'set'

def is_valid_sudoku(board)
  return false unless check_rows(board)
  return false unless check_cols(board)

  row = -3
  while (row += 3) < 9
    col = - 3
    while (col += 3) < 9
      start_point = [row, col]
      return false unless check_grid(board, start_point)
    end
  end
  true
end

def check_grid(board, start_point)
  row = start_point[0]
  col = start_point[1]
  ss = Set.new
  (row..(row + 2)).each do |cur_row|
    (col..(col + 2)).each do |cur_col|
      next if board[cur_row][cur_col] == '.'
      return false if ss.member?(board[cur_row][cur_col])

      ss.add board[cur_row][cur_col]
    end
  end
  true
end

def check_col(board, col)
  ss = Set.new
  (0..8).each do |row|
    next if board[row][col] == '.'
    return false if ss.member?(board[row][col])

    ss.add board[row][col]
  end
  true
end

def check_row(board, row)
  ss = Set.new
  (0..8).each do |col|
    next if board[row][col] == '.'
    return false if ss.member?(board[row][col])

    ss.add board[row][col]
  end
  true
end

def check_rows(board)
  (0..8).each do |row|
    return false unless check_row(board, row)
  end
  true
end

def check_cols(board)
  (0..8).each do |col|
    return false unless check_col(board, col)
  end
  true
end

board = [['5', '3', '.', '.', '7', '.', '.', '.', '.'],
         ['6', '.', '.', '1', '9', '5', '.', '.', '.'],
         ['.', '9', '8', '.', '.', '.', '.', '6', '.'],
         ['8', '.', '.', '.', '6', '.', '.', '.', '3'],
         ['4', '.', '.', '8', '.', '3', '.', '.', '1'],
         ['7', '.', '.', '.', '2', '.', '.', '.', '6'],
         ['.', '6', '.', '.', '.', '.', '2', '8', '.'],
         ['.', '.', '.', '4', '1', '9', '.', '.', '5'],
         ['.', '.', '.', '.', '8', '.', '.', '7', '9']]
print(is_valid_sudoku(board))
# => true

board = [['8', '3', '.', '.', '7', '.', '.', '.', '.'],
         ['6', '.', '.', '1', '9', '5', '.', '.', '.'],
         ['.', '9', '8', '.', '.', '.', '.', '6', '.'],
         ['8', '.', '.', '.', '6', '.', '.', '.', '3'],
         ['4', '.', '.', '8', '.', '3', '.', '.', '1'],
         ['7', '.', '.', '.', '2', '.', '.', '.', '6'],
         ['.', '6', '.', '.', '.', '.', '2', '8', '.'],
         ['.', '.', '.', '4', '1', '9', '.', '.', '5'],
         ['.', '.', '.', '.', '8', '.', '.', '7', '9']]
print(is_valid_sudoku(board))
# => false
# explanation: duplicated value in column

board = [['8', '3', '.', '.', '7', '.', '3', '.', '.'],
         ['6', '.', '.', '1', '9', '5', '.', '.', '.'],
         ['.', '9', '8', '.', '.', '.', '.', '6', '.'],
         ['8', '.', '.', '.', '6', '.', '.', '.', '3'],
         ['4', '.', '.', '8', '.', '3', '.', '.', '1'],
         ['7', '.', '.', '.', '2', '.', '.', '.', '6'],
         ['.', '6', '.', '.', '.', '.', '2', '8', '.'],
         ['.', '.', '.', '4', '1', '9', '.', '.', '5'],
         ['.', '.', '.', '.', '8', '.', '.', '7', '9']]
print(is_valid_sudoku(board))
# => false
# explanation: duplicated value in row

board = [['8', '3', '.', '.', '7', '.', '.', '.', '.'],
         ['6', '.', '.', '1', '9', '5', '.', '.', '.'],
         ['.', '9', '8', '.', '.', '.', '.', '6', '.'],
         ['.', '.', '.', '.', '6', '.', '.', '.', '3'],
         ['4', '.', '.', '8', '.', '3', '.', '.', '1'],
         ['7', '.', '.', '.', '2', '.', '.', '.', '6'],
         ['.', '6', '.', '.', '.', '.', '2', '8', '.'],
         ['.', '.', '.', '4', '1', '9', '.', '.', '5'],
         ['.', '.', '.', '.', '8', '.', '.', '7', '9']]
print(is_valid_sudoku(board))
# => false
# explanation: duplicated value in 3x3 grid
