require 'player'

describe 'player' do
  let(:player) { Player.new("Peter") }

  describe '#name' do
    it "returns the player's name" do
      expect(player.name).to eq("Peter")
    end
  end

  describe '#hp' do
    it "returns the player's hp" do
      expect(player.hp).to eq(Player::STARTING_HP)
    end
  end

  describe '#take_hit' do
    it "reduces player's HP by 10" do
      player.take_hit
      expect(player.hp).to eq(Player::STARTING_HP - 10)
    end
  end
end