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

  def move(number, character)
    false unless is_cell_available?(number)
    @cells.each do |row|
      row.each_index do |index|
        if row[index] === number
          row[index] = character
          return true
        end
      end
    end
  end

  def check_win_rows?(character)
    @cells.each do | row |
      count = 0
      row.each do |cell|
        if cell === character
          count += 1
          return true if count === 3
        else
          count -= 1 if count
        end
      end
    end
    false
  end

  def check_win_columns?(character)
    (0..2).each { |j|
      count = 0
      (0..2).each { |i|
        if @cells[i][j] === character
          count += 1
          return true if count === 3
        else
          count -= 1 if count
        end
      }
    }
    false
  end

  def check_win_diagonals?(character)
    count = 0
    (0..2).each do |i|
      if @cells[i][i] === character
        count += 1
        return true if count === 3
      else
        count -= 1 if count
      end
    end
    false
  end

  def check_win_rev_diagonals?(character)
    count = 0
    i = @cells.length - 1
    j = 0
    while i >= 0 do
      p @cells[j][i]
      if @cells[j][i] === character
        count += 1
        return true if count === 3
      else
        count -= 1 if count
      end
      i -= 1
      j += 1
    end
    false
  end
end


