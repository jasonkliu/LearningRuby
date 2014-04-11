=begin
There's two options here. 
class Foo
  def self.some_class_method
    puts self
  end
  def some_instance_method
      self.class.some_class_method
  end
end

print "Class method: "
Foo.some_class_method

print "Instance method: "
Foo.new.some_instance_method
=end

class Pokemon
  # https://stackoverflow.com/questions/4370960/what-is-attr-accessor-in-ruby
  # instead of def name @name end def name= newname @name = newname etc
  attr_accessor :name, :max_health, :current_health, :attack, :defense 
  attr_reader :cry, :moves

  def init(name = "Missingno", max_health = 169, attack = 10, defense = 10, cry = "BWAAAA")
    @name = name
    @cry = cry
    @attack = attack
    @defense = defense
    
    if max_health < 10 || max_health > 999  # Over our boundaries.
      @max_health = 169
    else
      @max_health = max_health
    end
    @current_health = @max_health

    puts @max_health.to_s
    puts @cry  # The Pokemon cries out!
  end

  def damage amount
    @current_health = @current_health - amount
  end

  def fullheal
    @current_health = @max_health
  end

  # type - single or dual
  def type
    @type
  end
  def type= newtype
    @type = newtype
  end
  def type2= newtype
    if nil != @type     # We have a type, so make a dual-type pokemon
      @type = @type + '/' + newtype
    else                # Else, just set it to the regular type.
      @type = newtype
    end
  end
  def cleartype
    @type = nil
  end

  # defense
  def boost_defense amount
    @defense += amount
  end

end

p = Pokemon.new
p.init
p.name= "Bulbasaur"

p.type= "Grass"
p.type2 = "Poison"
#puts p.type

p.cleartype
#puts p.type

p.type2= "Fairy"
#puts p.type

p.max_health= 24
p.current_health= 24
p.damage 4
p
p.damage 4
p
p.damage 4
p
p.damage 4
p

#puts p.current_health

class Kakuna < Pokemon
  
  def checkpp
    @hardenpp
  end
  def hardenpp
    @hardenpp = 30;
  end
  def pokedex  
    puts "    Almost incapable of moving, this Pokémon can only 
    harden its shell to protect itself from predators."
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
k.pokedex
k.defense= 50 #won't work in init
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

pika = Pikachu.new
pika.thundershock p
puts p.current_health
