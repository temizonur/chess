module DiagonalMove
  def possible_diag_left
    board = Board.class_variable_get(:@@board)
    possible_moves = []
    fake_y = @y
    fake_x = @x
    until fake_x == 7 || fake_y == 7
      fake_y += 1
      fake_x += 1
      possible_moves.push([fake_x, fake_y]) if (fake_x != @x && fake_y != @y) && board[fake_x][fake_y].color != @color
      if !(board[fake_x][fake_y].type.nil?)
        break
      end
    end
    until fake_x.zero? || fake_y.zero?
      fake_y -= 1
      fake_x -= 1
      possible_moves.push([fake_x, fake_y]) if (fake_x != @x && fake_y != @y) && board[fake_x][fake_y].color != @color
      if !(board[fake_x][fake_y].type.nil?)
        break
      end
    end
    possible_moves
  end

  def possible_diag_right
    board = Board.class_variable_get(:@@board)
    possible_moves = []
    fake_y = @y
    fake_x = @x
    until fake_x.zero? || fake_y == 7
      fake_x -= 1
      fake_y += 1
      possible_moves.push([fake_x, fake_y]) if (fake_x != @x && fake_y != @y) && board[fake_x][fake_y].color != @color
      if !(board[fake_x][fake_y].type.nil?)
        break
      end
    end
    until fake_x == 7 || fake_y.zero?
      fake_x += 1
      fake_y -= 1
      possible_moves.push([fake_x, fake_y]) if (fake_x != @x && fake_y != @y) && board[fake_x][fake_y].color != @color
      if !(board[fake_x][fake_y].type.nil?)
        break
      end
    end
    possible_moves
  end
end

module VerHorMove
  def possible_up_down
    board = Board.class_variable_get(:@@board)
    possible_moves = []
    fake_x = @x
    until fake_x.zero?
      fake_x -= 1
      possible_moves.push([fake_x, @y]) if fake_x != @x && board[fake_x][@y].color != @color
      if !(board[fake_x][@y].type.nil?)
        break
      end
    end
    fake_x = @x
    until fake_x == 7
      fake_x += 1
      possible_moves.push([fake_x, @y]) if fake_x != @x && board[fake_x][@y].color != @color
      if !(board[fake_x][@y].type.nil?)
        break
      end
    end
    possible_moves
  end

  def possible_right_left
    board = Board.class_variable_get(:@@board)
    possible_moves = []
    fake_y = @y
    until fake_y.zero?
      fake_y -= 1
      possible_moves.push([@x, fake_y]) if fake_y != @y && board[@x][fake_y].color != @color
      if !(board[@x][fake_y].type.nil?)
        break
      end
    end
    fake_y = @y
    until fake_y == 7
      fake_y += 1
      possible_moves.push([@x, fake_y]) if fake_y != @y && board[@x][fake_y].color != @color
      if !(board[@x][fake_y].type.nil?)
        break
      end
    end
    possible_moves
  end
end