class Player
  attr_reader :name, :hp

  STARTING_HP = 50
  def initialize(name, hp = STARTING_HP)
    @name = name
    @hp = hp
  end

  def take_hit
    @hp -= 10
  end
end