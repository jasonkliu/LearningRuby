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

  def move_add(move, pp)
    #puts [move, pp.to_s]
    @movelist << [move, pp]          # add move to movelist
    num = @movelist.find_index([move, pp]) # search the movelist for the move
    #puts @movelist[num][1]    # Multidimensional array, each has [move, pp]
    #puts @movelist[num]
    if @movelist[num][1] > 0
      puts "Using move #{move}"
      @movelist[num][1] -= 1
    else
      puts "#{@name} used Struggle!"
    end
  end


end

class Kakuna < Pokemon
  def initialize(name = self.class.name, cry = "waaaaaah!")
    self.init(name, 130, 10, 10, cry, "Bug", "Poison")
    self.move_add("Harden", 30)
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

k = Kakuna.new
puts k.max_health.to_s
k.pokedex
k.hardenpp
while k.checkpp > 0 do
  k.harden
end
k.harden # test out the struggle!
puts "hardenpp " + k.checkpp.to_s
puts "defense " + k.defense.to_s

class Pikachu < Pokemon
  def thundershock otherpokemon
    otherpokemon.damage 10
  end
  def tackle otherpokemon
    otherpokemon.damage 10
  end
  def recover
    #recoverme
  end
end

#pika = Pikachu.new
#pika.thundershock p
#puts p.current_health
