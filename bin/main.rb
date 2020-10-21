#!/usr/bin/env ruby

require_relative '../lib/game_logic.rb'
require_relative '../lib/player.rb'
require_relative '../lib/computer.rb'

def display_board(choices)
  puts ''
  puts " #{choices[0]}  | #{choices[1]}  | #{choices[2]}  "
  puts '--------------'
  puts " #{choices[3]}  | #{choices[4]}  | #{choices[5]}  "
  puts '--------------'
  puts " #{choices[6]}  | #{choices[7]}  | #{choices[8]}  "
  puts ''
end

def player_choice(choices)
  display_board(choices)
  choices
end

game = Game.new

print 'What is player 1 name? '
player = Player.new(gets.chomp)
while player.name.length.zero?
  puts 'Enter a valid name for player 1: '
  player = Player.new(gets.chomp)
end
print 'What is player 2 name? '
player2 = Computer.new(gets.chomp)
while player2.name.length.zero?
  puts 'Enter a valid name for player 2: '
  player2 = Computer.new(gets.chomp)
end
puts "Welcome #{player.name} and #{player2.name}!"
print 'Is it your first time playing tic-tac-toe? [Y]es [N]o? '
tutorial = gets.chomp
tutorial = tutorial.upcase

if tutorial == 'Y'
  puts "The game is played on a grid that's 3 squares by 3 squares."
  puts 'You are X, your friend (or the computer) is O.'
  puts 'Players take turns putting their marks in empty squares.'
  puts 'The first player to get 3 of her marks in a row (up, down, across, or diagonally) is the winner.'
  puts 'When all 9 squares are full, the game is over.'
  puts 'If no player has 3 marks in a row, the game ends in a tie.'
  puts "Alright! Now you are able to continue, let's start the game!"
else
  puts "Nice, let's start the game!"
end

count = 1
control = false
display_board(game.board)

while count < 6 && !control
  control = game.move(player.name, 'X', game)

  if control == true
    print "#{player.name} won!"
    break
  end

  if count < 5 && !control
    control = game.move(player2.name, 'O', game)

    if control == true
      print "#{player2.name} won!"
      break
    end
  else
    puts "It's a tie!"
  end
  count += 1
end
