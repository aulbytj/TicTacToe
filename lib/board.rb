class Board
  attr_reader :cells

  def initialize
    @cells = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]

    @moves = 0
  end

  def cell_available?(number)
    false if number < 1 || number > 9
    @cells.each do |row|
      row.each { |cell| return true if cell == number }
    end
    false
  end

  def draw
    p @cells
  end

  def move(number, character)
    return -1 unless cell_available?(number)

    @cells.each do |row|
      row.each_index do |index|
        next unless row[index] == number

        row[index] = character
        @moves += 1
        if @moves > 2
          return 1 if check_win?(character)
        end
      end
    end
    0
  end

  def moves?
    return true if @moves < 9

    false
  end

  def check_win_rows?(character)
    @cells.each do |row|
      count = 0
      row.each do |cell|
        if cell == character
          count += 1
          return true if count == 3
        elsif count
          count -= 1
        end
      end
    end
    false
  end

  def check_win_columns?(character)
    (0..2).each do |j|
      count = 0
      (0..2).each do |i|
        if @cells[i][j] == character
          count += 1
          return true if count == 3
        elsif count
          count -= 1
        end
      end
    end
    false
  end

  def check_win_diagonals?(character)
    count = 0
    (0..2).each do |i|
      if @cells[i][i] == character
        count += 1
        return true if count == 3
      elsif count
        count -= 1
      end
    end
    false
  end

  def check_win_rev_diagonals?(character)
    count = 0
    i = @cells.length - 1
    j = 0
    while i >= 0
      p @cells[j][i]
      if @cells[j][i] == character
        count += 1
        return true if count == 3
      elsif count
        count -= 1
      end
      i -= 1
      j += 1
    end
    false
  end

  def check_win?(character)
    return true if check_win_rows?(character)
    return true if check_win_columns?(character)
    return true if check_win_diagonals?(character)
    return true if check_win_rev_diagonals?(character)

    false
  end
end
