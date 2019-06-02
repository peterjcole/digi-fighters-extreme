class Game
  attr_reader :player_one, :player_two
  
  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @next_attacked = player_two
    @last_attacked = player_one
  end

  def attack_next
    attack(@next_attacked)
    switch_next_attacked
  end

  def last_attack_text
    return dead_text if @last_attacked.hp == 0
    alive_text
  end

  def self.create(player_one, player_two)
    @instance = Game.new(player_one, player_two)
  end

  def self.instance
    return @instance
  end

  private

  def alive_text
    "#{last_attacked_name} was attacked by #{last_attacker_name}!"
  end

  def dead_text
    "#{last_attacked_name} died and loses the game! #{last_attacker_name} wins!"
  end

  def last_attacked_name
    @last_attacked.name
  end

  def last_attacker_name
    @next_attacked.name
  end

  def attack(player)
    player.take_hit
  end

  def switch_next_attacked
    @next_attacked, @last_attacked = @last_attacked, @next_attacked
  end

end