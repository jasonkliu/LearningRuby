# We have a main Pokemon class, which allows you to 'init', setting values
# of all of the different stats, and also damage, etc. Each separate Pokemon
# inherits from the Pokemon class, which allows it to use the same methods.

class Pokemon
  # https://stackoverflow.com/questions/4370960/what-is-attr-accessor-in-ruby
  # instead of def name @name end def name= newname @name = newname etc
  attr_accessor :name, :max_health, :current_health, :attack, :defense, :type
  attr_reader :cry, :movelist

  def init(name = "Missingno", max_health = 169, attack = 10,
           defense = 10, cry = "BWAAAA", type = "Normal", type2 = nil)
    @name = name
    @cry = cry
    @attack = attack
    @defense = defense

    if nil != type && nil != type2   # Make a dual-type pokemon
      @type = type + '/' + type2
    else                             # Set it to the regular type.
      @type = type
    end
    
    if max_health < 10 || max_health > 999  # Over our boundaries.
      @max_health = 169
    else
      @max_health = max_health
    end
    @current_health = @max_health
    @movelist = []

    puts @cry  # The Pokemon cries out!
  end

  def damage amount
    @current_health = @current_health - amount
    if @current_health <= 0
      puts "#{@name} has fainted! Use next Pokemon?"
    end
  end

  def fullheal
    @current_health = @max_health
  end

  def boost_defense amount # Spamming Harden is the best!
    @defense += amount
  end

  def move_add attack
    @movelist << attack          # add move to movelist
    num = @movelist.find_index(attack)  # search the movelist for the move


    #puts @movelist[num][1]    # Multidimensional array, each has [move, pp]
    #puts @movelist[num]
    #if @movelist[num][1] > 0
    #  puts "Using move #{move}"
    #  @movelist[num][1] -= 1
    #else
    #  puts "#{@name} used Struggle!"
    #end
  end
end

class Move
  attr_accessor :name, :self_damage, :enemy_dmg, :self_defense, :pp, :pp_max

  def initialize(name, self_damage = 0, enemy_dmg = 0, self_defense = 1, pp = 30)
    @name = name
    @self_damage = self_damage
    @enemy_dmg = enemy_dmg
    @self_defense = self_defense
    @pp = pp
    @pp_max = pp
  end

  def max_ether
    @pp = @pp_max
  end
end

class Kakuna < Pokemon
  def initialize(name = self.class.name, cry = "waaaaaah!")
    self.init(name, 130, 10, 10, cry, "Bug", "Poison")
    self.move_add Move.new(:harden, 0, 0, 1, 30)
  end

  def pokedex  
    puts "    Almost incapable of moving, this Pokémon can only 
    harden its shell to protect itself from predators."
  end

  def checkpp
    @hardenpp
  end
  def hardenpp
    @hardenpp = 30;
  end
  def harden
    if @hardenpp > 0
      @hardenpp -= 1
      boost_defense 1
    else
      puts "Kakuna used struggle!"
    end
  end
end

class Pikachu < Pokemon
  def initialize(name = self.class.name, cry = "pikaaaa!")
    self.init(name, 145, 12, 12, cry, "Electric", nil)
    self.move_add Move.new(:harden, 0, 0, 1, 30)
  end

  def pokedex  
    puts "    It keeps its tail raised to monitor its surroundings. 
    If you yank its tail, it will try to bite you."
  end
end

k = Kakuna.new
puts "Move Name: " + k.movelist[0].name.to_s
k.pokedex

p = Pikachu.new
p.pokedex

#puts k.max_health.to_s
#k.hardenpp
#while k.checkpp > 0 do
#  k.harden
#end
#k.harden # test out the struggle!
#puts "hardenpp " + k.checkpp.to_s
#puts "defense " + k.defense.to_s



#pika = Pikachu.new
#pika.thundershock p
#puts p.current_health
