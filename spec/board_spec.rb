require_relative('../lib/board')

describe Board do
  let(:board) {Board.new}
  describe '#cell_available?' do
    it 'should return true if the cell is available' do
      expect(board.cell_available?('1')).to(eql(true))
    end

    it 'should return false if the cell is not available' do
      board.move('1', 'O')
      expect(board.cell_available?('1')).to(eql(false))
    end
  end

  describe '#draw' do
    it 'should return the game board' do
      expect(board.draw).to(eql("| 1 | 2 | 3 | \n| 4 | 5 | 6 | \n| 7 | 8 | 9 | \n"))
    end
  end

  describe '#move' do
    it 'should return 0 if the move did not result in a win' do
      expect(board.move('1', 'X')).to(eql(0))
    end

    it 'should return -1 if the cell is not available' do
      expect(board.move('0', 'X')).to(eql(-1))
    end

    it 'should return -2 if there are no more moves to make' do
      board.moves = 9
      expect(board.move('5', 'X')).to(eql(-2))
    end

    it 'should return 1 if the move results in a win' do
      board.move('1', 'X')
      board.move('2', 'X')
      expect(board.move('3', 'X')).to(eql(1))
    end
  end

  describe '#moves?' do
    it 'should return true if there are moves to make' do
      expect(board.moves?).to(eql(true))
    end

    it 'should return false there are no moves to make' do
      board.moves = 10
      expect(board.moves?).to(eql(false))
    end
  end

  describe '#check_win_rows?' do
    it 'should return false if the move did not result in a win' do
      expect(board.check_win_rows?('X')).to(be(false))
    end

    it 'should return true if the move resulted in a win' do
      board.move('1', 'X')
      board.move('2', 'X')
      board.move('3', 'X')
      expect(board.check_win_rows?('X')).to(be(true))
    end
  end

  describe '#check_win_columns?' do
    it 'should return false if the move did not result in a win' do
      expect(board.check_win_columns?('X')).to(be(false))
    end

    it 'should return true if the move resulted in a win' do
      board.move('1', 'X')
      board.move('4', 'X')
      board.move('7', 'X')
      expect(board.check_win_columns?('X')).to(be(true))
    end
  end

  describe '#check_win_diagonals?' do
    it 'should return false if the move did not result in a win' do
      expect(board.check_win_diagonals?('X')).to(be(false))
    end

    it 'should return true if the move resulted in a win' do
      board.move('1', 'X')
      board.move('5', 'X')
      board.move('9', 'X')
      expect(board.check_win_diagonals?('X')).to(be(true))
    end
  end

  describe '#check_win_rev_diagonals?' do
    it 'should return false if the move did not result in a win' do
      expect(board.check_win_rev_diagonals?('X')).to(be(false))
    end

    it 'should return true if the move resulted in a win' do
      board.move('3', 'X')
      board.move('5', 'X')
      board.move('7', 'X')
      expect(board.check_win_rev_diagonals?('X')).to(be(true))
    end
  end

  describe '#check_win?' do
    it 'should return true if the move resulted in a win on a row' do
      board.move('1', 'X')
      board.move('2', 'X')
      board.move('3', 'X')
      expect(board.check_win?('X')).to(be(true))
    end

    it 'should return true if the move resulted in a win on a row' do
      board.move('1', 'X')
      board.move('4', 'X')
      board.move('7', 'X')
      expect(board.check_win?('X')).to(be(true))
    end

    it 'should return true if the move resulted in a win diagonally' do
      board.move('1', 'X')
      board.move('5', 'X')
      board.move('9', 'X')
      expect(board.check_win?('X')).to(be(true))
    end

    it 'should return true if the move resulted in a win diagonally in the reverse' do
      board.move('3', 'X')
      board.move('5', 'X')
      board.move('7', 'X')
      expect(board.check_win?('X')).to(be(true))
    end

    it 'should return false if the move did not result in a win' do
      expect(board.check_win?('X')).to(be(false))
    end
  end
end
