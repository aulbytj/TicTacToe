require_relative '../lib/board'

describe Board do
  describe '#cell_available?' do
    it 'should return true' do
      board = Board.new
      expect(board.cell_available?('1')).to eql(true)
    end
  end

  describe '#draw' do
    it 'should return string' do
      board = Board.new
      expect(board.draw).to eql("| 1 | 2 | 3 | \n| 4 | 5 | 6 | \n| 7 | 8 | 9 | \n")
    end
  end

  describe '#move' do
    it 'should return 0' do
      board = Board.new
      expect(board.move('1', 'X')).to eql(0)
    end

    it 'should return -1' do
      board = Board.new
      expect(board.move('0', 'X')).to eql(-1)
    end

    it 'should return -2' do
      board = Board.new
      board.moves = 9
      expect(board.move('5', 'X')).to eql(-2)
    end

    it 'should return 1' do
      board = Board.new
      board.move('1', 'X')
      board.move('2', 'X')
      expect(board.move('3', 'X')).to eql(1)
    end
  end

  describe '#moves?' do
    it 'should return true' do
      board = Board.new
      expect(board.moves?).to eql(true)
    end

    it 'should return false' do
      board = Board.new
      board.moves = 10
      expect(board.moves?).to eql(false)
    end
  end

  describe '#check_win_rows?' do
    it 'should return false if the move did not result in a win' do
      board = Board.new
      expect(board.check_win_rows?('X')).to be(false)
    end

    it 'should return true if the move resulted in a win' do
      board = Board.new
      board.move('1', 'X')
      board.move('2', 'X')
      board.move('3', 'X')
      expect(board.check_win_rows?('X')).to be(true)
    end
  end

  describe '#check_win_columns?' do
    it 'should return false if the move did not result in a win' do
      board = Board.new
      expect(board.check_win_columns?('X')).to be(false)
    end

    it 'should return true if the move resulted in a win' do
      board = Board.new
      board.move('1', 'X')
      board.move('4', 'X')
      board.move('7', 'X')
      expect(board.check_win_columns?('X')).to be(true)
    end
  end
end
