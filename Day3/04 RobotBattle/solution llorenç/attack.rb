class Attack
  attr_reader :name, :damage

  def initialize(name, damage)
    @name = name
    @damage = damage
  end
end
