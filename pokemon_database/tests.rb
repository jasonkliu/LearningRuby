# pokemon.rb tests in rspec
require 'rspec'
require 'sqlite3'
require 'active_record'
require 'pry'
require 'csv'

require_relative 'poke_database_connection'
require_relative 'pokemon'
#run `ruby poke_database_creation.rb` once to create the database you start with

db = Pokemon.all

describe "Database", "#initialize" do

  it "changed hp correctly" do
    list = db.select {|pmon| pmon.hp > 100}
    list.length.should eq(0)
    list = db.select {|pmon| pmon.hp == 99}
    list.length.should eq(9) # Dunno if this is true, manual checking needed.
  end

  it "creates Missigno correctly" do
    miss = Pokemon.where(:name => "MISSINGNO")
    miss[0].name.should eq("MISSINGNO")
    miss[0].poke_num.should eq(152)
    miss[0].poke_type.should eq("BIRD/NORMAL")
    miss[0].hp.should eq(33)
    miss[0].attack.should eq(136)
    miss[0].defense.should eq(0)
    miss[0].sp_atk.should eq(0)
    miss[0].sp_def.should eq(0)
    miss[0].speed.should eq(29)
  end

  it "deletes jigglypuff correctly" do
    jigg = Pokemon.where(:name => "Jigglypuff")
    jigg[0].should be_nil #passes if object is nil
    miss = Pokemon.where(:name => "MISSINGNO")
	miss[0].should be_true #truthy, not nil or false
  end

end
