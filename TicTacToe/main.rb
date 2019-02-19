require_relative 'Utils/print_utils'
require_relative 'Utils/prompt_utils'
require_relative 'board'
require_relative 'cell'

board = Board.new(3)
current_type = CellType::NONE
victory = false
loop do
  current_type = (current_type == CellType::CROSS) ? CellType::CIRCLE : CellType::CROSS
  x, y = nil

  PrintUtils.print_board(board)
  PrintUtils.print_new_turn(current_type)

  loop do
    x, y = PromptUtils.prompt_coordinates(board.get_size)
    break if board.get_cell_type(x, y) == CellType::NONE
  end

  board.set_cell_type(x, y, current_type)
  break if (victory = board.check_victory_from(x, y)) || board.is_board_full
end

PrintUtils.print_board(board)
if victory
  PrintUtils.print_victory(current_type)
else
  PrintUtils.print_draw
end