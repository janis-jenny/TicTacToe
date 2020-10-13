#!/usr/bin/env ruby
print 'What is your name? '
player_name = gets.chomp
puts "Welcome #{player_name}!"
print 'Is it your first time playing tic-tac-toe? [Y]es [N]o? '
tutorial = gets.chomp
tutorial = tutorial.upcase

if tutorial == 'Y'
  puts "The game is played on a grid that's 3 squares by 3 squares."
  puts 'You are X, your friend (or the computer in this case) is O.'
  puts 'Players take turns putting their marks in empty squares.'
  puts 'The first player to get 3 of her marks in a row (up, down, across, or diagonally) is the winner.'
  puts 'When all 9 squares are full, the game is over.'
  puts 'If no player has 3 marks in a row, the game ends in a tie.'
  puts "Alright! Now you are able to continue, let's start the game!"
else
  puts "Nice, let's start the game!"
end
