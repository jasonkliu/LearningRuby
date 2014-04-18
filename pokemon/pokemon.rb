# We have a main Pokemon class, which allows you to 'init', setting values
# of all of the different stats, and also damage, etc. Each separate Pokemon
# inherits from the Pokemon class, which allows it to use the same methods.

$DEBUG = false # Turn on true for print statements, like #ifdef DEBUG

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

    if $DEBUG == true
      puts @cry  # The Pokemon cries out!
    end
  end

  def damage amount
    @current_health = @current_health - amount
    if @current_health <= 0 and $DEBUG == true
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

    define_singleton_method attack.name do |enemy|
      num = @movelist.find_index(attack)  # search the movelist for the move
      if @current_health <= 0
        if $DEBUG == true
          puts "#{@name} has fainted!"
        end
      elsif @movelist[num].pp > 0
        self.damage @movelist[num].self_damage
        self.boost_defense @movelist[num].self_defense
        enemy.damage @movelist[num].enemy_dmg

        @movelist[num].pp -= 1 # minus the pp
      else
        if $DEBUG == true
          puts "#{@name} used struggle!"
        end
      end
    end
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
    self.move_add Move.new(:struggle, 5, 10, 0, 99)
  end

  def pokedex  
    puts "    Almost incapable of moving, this Pokémon can only 
    harden its shell to protect itself from predators."
  end
end

class Pikachu < Pokemon
  def initialize(name = self.class.name, cry = "pikaaaa!")
    self.init(name, 145, 12, 11, cry, "Electric", nil)
    self.move_add Move.new(:thundershock, 0, 20, 1, 30)
    self.move_add Move.new(:struggle, 5, 10, 0, 99)
  end

  def pokedex  
    puts "    It keeps its tail raised to monitor its surroundings. 
    If you yank its tail, it will try to bite you."
  end
end

#k = Kakuna.new
#puts "Move Name: " + k.movelist[0].name.to_s
#k.pokedex
#puts k.defense # should be 10
#k.harden k
#k.harden k
#k.harden k
#k.harden k
#puts k.defense # should be 14

#p = Pikachu.new
#p.pokedex
#puts k.current_health # should be 130
#p.thundershock k
#puts k.current_health # should be 110

