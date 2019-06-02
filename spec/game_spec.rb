require 'game'

describe 'game' do
  let(:game) { Game.new(player_one, player_two) }
  let(:player_one) { double(:player) }
  let(:player_two) { double(:player) }

  
  describe '#attack' do
    it 'calls take_hit on the correct player' do
      pending("#attack is private, not sure if temporary yet")
      expect(player_two).to receive(:take_hit)
      game.attack(:player_two)
    end
  end

  describe '#attack_next' do
    it 'calls take_hit on player 2 the first time' do
      expect(player_two).to receive(:take_hit)
      game.attack_next
    end
    it "doesn't call take_hit on player 1 the first time" do
      allow(player_two).to receive(:take_hit)
      expect(player_one).not_to receive(:take_hit)
      game.attack_next
    end
    it 'calls take_hit on player 1 the second time' do
      allow(player_two).to receive(:take_hit)
      game.attack_next
      expect(player_one).to receive(:take_hit)
      game.attack_next
    end
    it "doesn't call take_hit on player 2 the second time" do
      allow(player_two).to receive(:take_hit)
      game.attack_next
      allow(player_one).to receive(:take_hit)
      expect(player_two).not_to receive(:take_hit)
      game.attack_next
    end
    it 'calls take_hit on the correct player the 50th time' do
      allow(player_one).to receive(:take_hit)
      allow(player_two).to receive(:take_hit)
      49.times { game.attack_next }
      expect(player_two).not_to receive(:take_hit)
      expect(player_one).to receive(:take_hit)
      game.attack_next
    end
  end

  describe '#last_attacker_name' do
    before(:each) do
      allow(player_one).to receive(:take_hit)
      allow(player_two).to receive(:take_hit)
    end

    it 'calls #name on player_one after first attack' do
      game.attack_next
      expect(player_one).to receive(:name)
      game.last_attacker_name
    end

    it 'returns the return value of #name' do
      allow(player_one).to receive(:name).and_return 'Player One'
      game.attack_next
      expect(game.last_attacker_name).to eq('Player One')
    end

    it "returns player two's name after second attack" do
      allow(player_one).to receive(:name)
      allow(player_two).to receive(:name).and_return 'Player Two'
      game.attack_next
      game.attack_next
      expect(game.last_attacker_name).to eq('Player Two')
    end

    it "returns player one's name after 49th attack" do
      allow(player_one).to receive(:name).and_return 'Player One'
      allow(player_two).to receive(:name)
      49.times { game.attack_next }
      expect(game.last_attacker_name).to eq('Player One')
    end
  end

  describe '#last_attacker_name' do
    before(:each) do
      allow(player_one).to receive(:take_hit)
      allow(player_two).to receive(:take_hit)
    end

    it 'calls #name on player_two after first attack' do
      game.attack_next
      expect(player_two).to receive(:name)
      game.last_attacked_name
    end

    it 'returns the return value of #name' do
      allow(player_two).to receive(:name).and_return 'Player Two'
      game.attack_next
      expect(game.last_attacked_name).to eq('Player Two')
    end

    it "returns player one's name after second attack" do
      allow(player_one).to receive(:name).and_return 'Player One'
      allow(player_two).to receive(:name)
      game.attack_next
      game.attack_next
      expect(game.last_attacked_name).to eq('Player One')
    end

    it "returns player two's name after 49th attack" do
      allow(player_one).to receive(:name)
      allow(player_two).to receive(:name).and_return 'Player Two'
      49.times { game.attack_next }
      expect(game.last_attacked_name).to eq('Player Two')
    end
  end

  describe '#players' do
    it 'returns hash of players' do
      expect(game.players).to eq({ player_one: player_one, player_two: player_two} )
    end
  end


end