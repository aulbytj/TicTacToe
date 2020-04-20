class Board
  attr_reader :cells

  def initialize
    @cells = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
    ]
  end

  def is_cell_available?(number)
    false if number < 1 || number > 9
    @cells.each do |row|
      row.each { |cell| return true if cell === number }
    end
    false
  end
end

