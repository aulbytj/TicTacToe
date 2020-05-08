require_relative('../lib/player')

describe Player do
  let(:player) { Player.new('jay', 'X') }
  describe '#player' do
    it 'should return if has player' do
      expect(player).to(be_kind_of(Player))
    end
  end
end
