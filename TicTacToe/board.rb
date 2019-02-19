require_relative 'cell'

class Board
  def initialize(size)
    @size = size
    @cells = Array.new(size){Array.new(size){Cell.new}}
    nil
  end

  # Get the size of the board (which is a square)
  # @return [Integer]
  def get_size
    @size
  end

  # Get the type of a cell
  # @param [Integer] x
  # @param [Integer] y
  # @return [CellType]
  def get_cell_type(x, y)
    @cells[x][y].get_type
  end

  # Change the type of a cell
  # @param [Integer] x
  # @param [Integer] y
  # @param [CellType] type
  def set_cell_type(x, y, type)
    @cells[x][y].change_type(type)
  end

  # Check if the player wins the game, from given coordinates
  # @param [Integer] x
  # @param [Integer] y
  # @return [Boolean]
  def check_victory_from(x, y)
    _type = get_cell_type(x, y)

    _x = x
    _y = y

    count_type_from(x, y, 1, 0, _type) + count_type_from(x, y, -1, 0, _type) + 1 == @size \
      || count_type_from(x, y, 0, 1, _type) + count_type_from(x, y, 0, -1, _type) + 1 == @size \
      || count_type_from(x, y, 1, 1, _type) + count_type_from(x, y, -1, -1, _type) + 1 == @size \
      || count_type_from(x, y, 1, -1, _type) + count_type_from(x, y, -1, 1, _type) + 1 == @size
  end

  # Count the number of times the cells have the same type in a given direction
  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] vx
  # @param [Integer] vy
  # @param [CellType] type
  # @return [Integer]
  def count_type_from(x, y, vx, vy, type)
    _nb_type = 0
    x += vx
    y += vy

    # Loops while there are more cells of the same type in a given direction
    while x >= 0 && x < @size && y >= 0 && y < @size && get_cell_type(x, y) == type
      x += vx
      y += vy

      _nb_type += 1
    end

    _nb_type
  end

  # Check if the board is full (no one can play anymore)
  # @return [Boolean]
  def is_board_full
    _x = 0
    _y = 0
    _increment = true

    while _x < @size && _increment
      _increment = false
      _y = 0
      while _y < @size && get_cell_type(_x, _y) != CellType::NONE
        _increment = true
        _y += 1
      end
      _x += 1
    end

    _x == @size && _y == @size
  end
end