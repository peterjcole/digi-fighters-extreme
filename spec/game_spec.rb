require 'game'

describe 'game' do
  let(:game) { Game.new(player_one, player_two) }
  let(:player_one) { double(:player) }
  let(:player_two) { double(:player) }

  describe '#player_one' do
    it 'returns player one' do
      expect(game.player_one).to be player_one
    end
  end

  describe '#player_two' do
    it 'returns player two' do
      expect(game.player_two).to be player_two
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

  describe '#last_attack_text' do
    before(:each) do
      allow(player_one).to receive(:take_hit)
      allow(player_two).to receive(:take_hit)
      allow(player_one).to receive(:name).and_return("Player One")
      allow(player_two).to receive(:name).and_return("Player Two")
      allow(player_one).to receive(:hp).and_return 50
      allow(player_two).to receive(:hp).and_return 50
    end

    context 'players still alive' do
      it 'returns the correct text after one attack' do
        game.attack_next
        expect(game.last_attack_text).to eq("Player Two was attacked by Player One!")
      end

      it 'returns the correct text after two attacks' do
        game.attack_next
        game.attack_next
        expect(game.last_attack_text).to eq("Player One was attacked by Player Two!")
      end
    end

    context 'a player has died' do
      it 'returns text saying player one has died when HP is 0' do
        allow(player_two).to receive(:hp).and_return 0
        9.times { game.attack_next }
        expect(game.last_attack_text).to eq("Player Two died and loses the game! Player One wins!")
      end
    end
  end

  describe '.create' do
    it "doesn't error when passed two players" do
      expect { Game.create(player_one, player_two) }.not_to raise_error
    end
  end

  describe '.instance' do
    it 'returns created instance of the Game class' do
      Game.create(player_one, player_two)
      expect(Game.instance).to be_a Game
    end

    it 'returns the same instance multiple times' do
      Game.create(player_one, player_two)
      game_one = Game.instance
      game_two = Game.instance
      expect(game_one).to be game_two
    end
  end
end