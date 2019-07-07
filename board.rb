# frozen_string_literal: true

require './pieces'

class Board
  attr_reader :board
  def initialize
    @@board = Array.new(8) { Array.new(8) }
    initialize_pieces('black')
    initialize_pieces('white')
    @@board[3..6].each_with_index do |r, row|
      r.each_with_index do |_c, col|
        @@board[row + 2][col] = Cell.new(row + 2, col)
      end
    end
    end

  def initialize_pieces(color, r = '♖', k = '♘', pi = '♙', ki = '♔', q = '♕', b = '♗', piece_row = 7, pawn_row = 6)
    if color == 'white'
      piece_row = 0
      pawn_row = 1
      r = '♜'
      k = '♞'
      pi = '♟'
      ki = '♚'
      q = '♛'
      b = '♝'
    end
    @@board[piece_row][0] = Rook.new(piece_row, 0, 'rook', r, color)
    @@board[piece_row][7] = Rook.new(piece_row, 7, 'rook', r, color)
    @@board[piece_row][1] = Knight.new(piece_row, 1, 'knight', k, color)
    @@board[piece_row][6] = Knight.new(piece_row, 6, 'knight', k, color)
    @@board[piece_row][2] = Bishop.new(piece_row, 2, 'bishop', b, color)
    @@board[piece_row][5] = Bishop.new(piece_row, 5, 'bishop', b, color)
    @@board[piece_row][3] = Queen.new(piece_row, 3, 'queen', q, color)
    @@board[piece_row][4] = King.new(piece_row, 4, 'king', ki, color)
    @@board[pawn_row].each_with_index do |_pawn, index|
      @@board[pawn_row][index] = Pawn.new(pawn_row, index, 'pawn', pi, color)
    end
  end

  def display
    puts '┏━┳━┳━┳━┳━┳━┳━┳━┓'
    @@board.each_with_index do |row, index|
      puts '┃' + row.join('┃') + '┃'
      puts '┣━╋━╋━╋━╋━╋━╋━╋━┫' if index != @@board.length - 1
    end
    puts '┗━┻━┻━┻━┻━┻━┻━┻━┛'
  end

  def move_piece(x, y, wanted_x, wanted_y)
    @@board[x][y].move(wanted_x, wanted_y)
    new_x = @@board[x][y].x
    new_y = @@board[x][y].y
    p [new_x,new_y]
    @@board[new_x][new_y] = @@board[x][y]
    @@board[x][y] = Cell.new(x, y)
    display
  end

  def is_ally?(wanted_x, wanted_y, player_color)
    return true if @@board[wanted_x][wanted_y].color == player_color

    false
  end

  def ask_to_move(player_color)
    loop do
      answer = gets.chomp
      answer = answer.split(',')
      answer = answer.collect(&:to_i)
      if !is_ally?(answer[2], answer[3], player_color) && @@board[answer[0]][answer[1]].can_move?(answer[2], answer[3])
        move_piece(answer[0], answer[1], answer[2], answer[3])
      else
        puts 'no'
      end
    end
  end

end