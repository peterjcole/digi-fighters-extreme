require 'game'

describe 'game' do
  let(:game) { Game.new(player_one, player_two) }
  let(:player_one) { double(:player) }
  let(:player_two) { double(:player) }

  
  describe '#attack' do
    it 'calls take_damage on the correct player' do
      expect(player_two).to receive(:take_hit)
      game.attack(:player_two)
    end
  end

  describe '#players' do
    it 'returns hash of players' do
      expect(game.players).to eq({ player_one: player_one, player_two: player_two} )
    end
  end


end