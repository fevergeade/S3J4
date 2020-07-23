class Player
  attr_accessor :name, :icon_p, :nb_victory

  def initialize (name, icon)
    @name = name
    @icon_p = icon
    @nb_victory = 0
  end

end