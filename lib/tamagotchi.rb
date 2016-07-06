class Tamagotchi
  @@tamagotchies = []
  define_method(:initialize) do |name|
    @name = name
    @food = 5
    @play = 5
    @rest = 5
    @health = 10
    @attack = rand(4)
    @defense = rand(2)
    @age = Time.new()
    @time = Time.new()
    @@tamagotchies.push(self)
  end
  define_method(:attack) do
    @attack
  end
  define_method(:defense) do
    @defense
  end
  define_method(:take_damage) do |damage|
    if damage > 0
      @health -= damage
    else
      'The defense is too strong!'
    end
  end
  define_method(:fight) do |target|
    damage = self.attack() - target.defense()
    target.take_damage(damage)
  end
  define_singleton_method(:pets) do
    @@tamagotchies
  end
  define_method(:remove) do
    @@tamagotchies.delete(self)
  end
  define_method(:name) do
    @name
  end
  define_method(:age) do
    Time.new().min - @age.min
  end
  define_method(:food) do
    @food
  end
  define_method(:happiness) do
    @play
  end
  define_method(:rest) do
    @rest
  end
  define_method(:prepare) do
    self.time_passing()
    if self.alive?() == true
      puts @food
      puts @play
      puts @rest
      puts @health
      Time.new() - @age
    end
  end
  define_method(:feed) do |noms|
    @food += noms
    if @food > 10
      @food = 10
    end
  end
  define_method(:sleep) do |zzs|
    @rest += zzs
    if @rest > 10
      @rest = 10
    end
  end
  define_method(:play) do |gigs|
    @play += gigs
    if @play > 10
      @play = 10
    end
  end
  define_method(:time_passing) do
    if (Time.now.min > @time.min) && (Time.now.hour == @time.hour)
      decrease_by = Time.now.min - @time.min
      if (@food - decrease_by) >= 0
        @food -= decrease_by
      else
        @food = 0
      end
      if (@play - decrease_by) >= 0
        @play -= decrease_by
      else
        @play = 0
      end
      if (@rest - decrease_by) >= 0
        @rest -= decrease_by
      else
        @rest = 0
      end
    elsif (Time.now.min < @time.min)
      decrease_by = (60 - @time.min) + Time.new.min
      if (@food - decrease_by) >= 0
        @food -= decrease_by
      else
        @food = 0
      end
      if (@play - decrease_by) >= 0
        @play -= decrease_by
      else
        @play = 0
      end
      if (@rest - decrease_by) >= 0
        @rest -= decrease_by
      else
        @rest = 0
      end
    end
    @time = Time.now
  end
  define_method(:alive?) do
    if (@food > 0) && (@play > 0) && (@rest > 0) && (@health > 0)
      true
    else
      false
    end
  end
end
