class Player
  attr_reader :name, :hp

  STARTING_HP = 50
  def initialize(name)
    @name = name
    @hp = 50
  end

  def take_hit
    @hp -= 10
  end
end