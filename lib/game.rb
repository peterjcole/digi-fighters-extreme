class Game
  attr_reader :players
  
  def initialize(player_one, player_two)
    @players = {
      player_one: player_one,
      player_two: player_two
    }
    @next_attacked = :player_two
    @last_attacked = :player_one
  end

  def attack_next
    attack(@next_attacked)
    switch_next_attacked
  end

  def last_attacked_name
    @players[@last_attacked].name
  end

  def last_attacker_name
    @players[@next_attacked].name
  end

  private

  def attack(player)
    @players[player].take_hit
  end

  def switch_next_attacked
    @next_attacked, @last_attacked = @last_attacked, @next_attacked
  end

end