require 'sqlite3'
require 'active_record'
require 'pry'
require 'csv'

require_relative 'poke_database_connection'
require_relative 'pokemon'
#run `ruby poke_database_creation.rb` once to create the database you start with

db = Pokemon.all # Initialize the database!

#1. What is the first pokemon in our database? Our last one?
#This is pretty cool that Ruby can do this, by the way
puts "First: " + db.first.name.to_s
puts "Last: " + db.last.name.to_s
puts "\n"

#2. Are any pokemon palindromes? If so, which ones?
list = db.select {|pmon| pmon.name.downcase == pmon.name.downcase.reverse}
puts "Palindromes: "
list.each do |i|
  puts i.name.to_s
end
puts "\n"

#3. Find all pokemon that are GHOST type.
list = db.select {|pmon| pmon.poke_type == "GHOST"}
puts "Ghost: "
list.each do |i|
  puts i.name.to_s
end
puts "\n"

#4. Are there more pokemon with even pokemon numbers who are GRASS type or who are FIRE type?
list1 = db.select {|pmon| pmon.poke_type == "GRASS" and pmon.poke_num % 2 == 0}
list2 = db.select {|pmon| pmon.poke_type == "FIRE" and pmon.poke_num % 2 == 0}
if list1.length < list2.length
  puts "More FIRE than GRASS Pokemon"
elsif list1.length > list2.length
  puts "More GRASS than FIRE Pokemon"
else 
  puts "Equal numbers! hahah"
end
puts "\n"

#5. Try to defeat Charizard. Find a pokemon with special attack (sp_attack) greater than 78 and whose type is water.
list = db.select {|pmon| pmon.sp_atk > 78 and pmon.poke_type == "WATER"}
puts "Possibilities: "
list.each do |i|
  puts i.name.to_s
end
puts "\n"

#6. Pokemon can no longer have over 100 health (hp). Update any pokemon who has health greater than 100 to have only 99 health (hp).
list = db.select {|pmon| pmon.hp > 100}
list.each do |i|
  i.hp = 99
  i.save
end

#7. Make a new pokemon. What attributes are necessary? What attributes do you want to make sure you put in?
#Using the format from poke_database_creation.rb
Pokemon.create({
  poke_num: 152,
  name: "MISSINGNO",
  poke_type: "BIRD/NORMAL",
  hp: 33,
  attack: 136,
  defense: 0,
  sp_atk: 0,
  sp_def: 0,
  speed: 29
})


#8. Everyone hates Jigglypuff. Remove that pokemon from the database (and existance!). Make sure it's not just removed from Rubyland, but also from Databaseland.
puff = Pokemon.where(:name => "Jigglypuff")
#puts puff[0].name #puts puff[0].to_s
if puff[0] == nil 
  puts "puff is nil"
else 
  puff.destroy(puff)
end

binding.pry

