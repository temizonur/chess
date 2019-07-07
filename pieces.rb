# frozen_string_literal: true

class Cell
  attr_reader :icon, :x, :y, :color, :type
  def initialize(x, y, type = nil, icon = ' ', color = nil)
    @x = x
    @y = y
    @type = type
    @icon = icon
    @color = color
  end

  def to_s
    @icon
  end
end

class Rook < Cell
  def initialize(x, y, type, icon, color)
    super
  end
end

class Bishop < Cell
  def initialize(x, y, type, icon, color)
    super
  end
end

class Queen < Cell
  def initialize(x, y, type, icon, color)
    super
  end
end

class King < Cell
  def initialize(x, y, type, icon, color)
    super
  end
end

class Knight < Cell
  def initialize(x, y, type, icon, color)
    super
  end

  def can_move?(wanted_x, wanted_y)
    possible_moves = [[2, 1], [1, 2], [-2, 1], [-1, 2], [2, -1], [1, -2], [-2, -1], [-1, -2]]
    possible_moves.each do |move|
      if @x + move[0] == wanted_x && @y + move[1] == wanted_y
        return [@x + move[0], @y + move[1]]
      end
    end
    nil
  end

  def move(wanted_x, wanted_y)
    new_pos = can_move?(wanted_x, wanted_y)
    @x = new_pos[0]
    @y = new_pos[1]
  end
end

class Pawn < Cell
  def initialize(x, y, type, icon, color)
    super
  end

  def can_move?(wanted_x, wanted_y)
    board = Board.class_variable_get(:@@board)
    if board[wanted_x][wanted_y].type.nil?
      if @color == 'white'
        return @x + 1
      else
        return @x - 1
      end
    end
    nil
  end

  def move(wanted_x, wanted_y)
    @x = can_move?(wanted_x, wanted_y)
  end
end
