class Player

  attr_accessor :warrior

  def play_turn(warrior)
    @warrior = warrior unless @warrior

    if empty_land?
      if taking_damage?
        warrior.walk!
      else 
        warrior.rest!
      end
    else
      if captives_around?
        warrior.rescue!
      else
        warrior.attack!
      end
    end

    @health = warrior.health
    
  end

  private

  def healthy?
    @warrior.health > 15
  end

  def taking_damage?
    @health > @warrior.health
  end

  def empty_land?
    @warrior.feel.empty?
  end

end
