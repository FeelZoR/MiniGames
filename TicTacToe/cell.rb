module CellType
  NONE = ' '
  CROSS = 'X'
  CIRCLE = 'O'
end

class Cell
  def initialize
    @type = CellType::NONE
  end

  # Change the type of the cell
  # @param [CellType] new_type
  def change_type(new_type)
    @type = new_type
  end

  # Get the type of the cell
  # @return [CellType]
  def get_type
    @type
  end
end