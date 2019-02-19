class PromptUtils
  class << self
    # Prompt the user for input
    # @param [String] args
    # @return [Object] The inputted value
    def prompt(*args)
      print(*args)
      gets
    end

    # Prompt the user to enter coordinates
    # @param [Integer] max The maximum value for both x and y
    # @return [Array] An array representing x and y coordinates
    def prompt_coordinates(max)
      _x, _y = nil
      loop do
        _x = (prompt "Input x: ").to_i
        break if _x > 0 && _x <= max
      end

      loop do
        _y = (prompt "Input y: ").to_i
        break if _y > 0 && _y <= max
      end
      [_x - 1, _y - 1]
    end
  end
end