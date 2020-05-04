require_relative '../../lib/board'

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
end
