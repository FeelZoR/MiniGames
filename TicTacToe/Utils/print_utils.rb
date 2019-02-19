require_relative '../board'

class PrintUtils
  # This class only has static methods
  class << self
    # Show the board
    # @param [Board] board
    def print_board(board)
      _size = board.get_size
      (0.._size - 1).each {|y|
        (0.._size - 1).each {|x|
          print('| ' + board.get_cell_type(x, y) + ' ')
        }
        puts('|')
      }
    end

    # Print the message for a new turn, saying who's turn it is
    # @param [CellType] type
    def print_new_turn(type)
      puts("It's " + type + "'s turn.")
    end

    # Print the message for victory
    # @param [CellType] type
    def print_victory(type)
      puts(type + " wins!")
    end

    # Print the message for a draw
    def print_draw
      puts("No one could win this game... it's a draw!")
    end
  end
end