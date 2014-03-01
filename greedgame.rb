#!/usr/bin/env ruby

# Greed is a dice game where you roll up to five dice to accumulate
# points.  The following "score" function will be used to calculate the
# score of a single roll of the dice.
#
# A greed roll is scored as follows:
#
# * A set of three ones is 1000 points
#
# * A set of three numbers (other than ones) is worth 100 times the
#   number. (e.g. three fives is 500 points).
#
# * A one (that is not part of a set of three) is worth 100 points.
#
# * A five (that is not part of a set of three) is worth 50 points.
#
# * Everything else is worth 0 points.
#
#
# Examples:
#
# score([1,1,1,5,1]) => 1150 points
# score([2,3,4,6,2]) => 0 points
# score([3,4,5,3,3]) => 350 points
# score([1,5,1,2,4]) => 250 points
#
# More scoring examples are given in the tests below:
#
# Your goal is to write the score method.

def score(dice)
  @num = @points = 0 # Number of points
  dice = dice.sort! # Sort the array
  @len = dice.length
  #puts dice
  #puts @len
  if [] == dice
    #puts "Score: 0"
    return 0
  end 
  while @num < @len
    @num_curr = dice.count(dice[@num])
    #puts @num_curr
    if 1 == dice[@num]
      if @num_curr >= 3
        @points += 1000  # Add 1000 points
        @points += 100 * (@num_curr - 3) # Add 100x
    else 
      @points += 100 * @num_curr # Add 100x
    end
      @num += @num_curr # Push forward num
    elsif 5 == dice[@num]
      if @num_curr >= 3
        @points += 500  # Add 500 points
        @points += 50 * (@num_curr - 3) # Add 50x 
    else 
      @points += 50 * @num_curr # Add 50x 
      end
      @num += @num_curr # Push forward num
    else
      if @num_curr >= 3
        @points += 100*dice[@num]  # Add 100*n
      end 
      @num += @num_curr # Push forward num
    end 
  end 
  return @points
end  
