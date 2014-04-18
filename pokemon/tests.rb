# pokemon.rb tests in rspec
require 'rspec'
require './pokemon.rb'

describe Pokemon, "#initialize" do
  k = Kakuna.new
  p = Pikachu.new	

  it "initializes Kakuna correctly" do
    k.name.should eq("Kakuna")
    k.current_health.should eq(130)
    k.attack.should eq(10)
    k.defense.should eq(10)
    k.type.should eq("Bug/Poison")
  end

  it "initializes Pikachu correctly" do
    p.name.should eq("Pikachu")
    p.current_health.should eq(145)
    p.attack.should eq(12)
    p.defense.should eq(11)
    p.type.should eq("Electric")
  end

  it "correctly uses moves" do
    k.defense.should eq(10) # harden = defense + 1
    k.harden k
    k.defense.should eq(11)
    29.times { k.harden k } # Run 29 more times 
    k.defense.should eq(40) 
    k.harden k              # out of pp!
    k.defense.should eq(40)
  end

  it "correctly uses moves" do
    k.current_health.should eq(130) # thundershock = 20 dmg
    p.thundershock k
    k.current_health.should eq(110)
    k.max_health.should eq(130)
    5.times { p.thundershock k } # Run 29 more times 
    k.current_health.should eq(10)   
    k.defense.should eq(40) # recheck to see if it saved
    p.thundershock k
    k.movelist[1].pp.should eq(99) # pp of move #2, struggle
    k.struggle p
    k.movelist[1].pp.should eq(99) # can't move b/c fainted
  end

end