class Game
  attr_reader :players
  
  def initialize(player_one, player_two)
    @players = {
      player_one: player_one,
      player_two: player_two
    }
  end

  def attack(player)
    @players[player].take_hit
  end

end