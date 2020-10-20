#!/usr/bin/env ruby
require_relative '../lib/game_logic.rb'
require_relative '../lib/player.rb'
require_relative '../lib/computer.rb'

# define the function first to avoid undefine error when it is called
def display_board(choices)
  puts ''
  puts " #{choices[0]}  | #{choices[1]}  | #{choices[2]}  "
  puts '--------------'
  puts " #{choices[3]}  | #{choices[4]}  | #{choices[5]}  "
  puts '--------------'
  puts " #{choices[6]}  | #{choices[7]}  | #{choices[8]}  "
  puts ''
end
# game.board ---> shows the board first time from game_logic

def player_choice(choices)
  display_board(choices)
  choices
end

# Create the instances variables of the class
# computer = computer.name it is the name of the variable it is brought here w the attr_reader
game = Game.new

computer = Computer.new
# computer.name = "Jenny" ---> it cant change cause we used attr_reader

# Ask the player's name
print 'What is your name? '
player = Player.new(gets.chomp)
puts "Welcome #{player.name}!"
print 'Is it your first time playing tic-tac-toe? [Y]es [N]o? '
tutorial = gets.chomp
tutorial = tutorial.upcase

# If the user never played before, it displays a fast tutorial.
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

# Main method created to control the game loop!
count = 1
control = false

while count < 6 && !control
  display_board(game.board) # it recieves the board
  valid_move = false
  while valid_move == false
    print 'Please make a move, choose a number: '
    player_move = gets.chomp.to_i - 1
    valid_move = game.check_move(player_move, 'X')
    puts 'Try again' if valid_move == false
  end
  control = game.check_winner(player.name, 'X')

  if control == true
    display_board(game.board)
    print 'Player won!'
    break
  end

  if count < 5 && !control
    valid_move = false
    while valid_move == false
      # You check if is a valid move here, u call in the computer_choice the class computer,
      # that returns a number and then u check if that number is valid w the class game,
      # cause u send there the number and the simbol of the computer
      computer_choice = computer.computer_move
      valid_move = game.check_move(computer_choice, 'O')
    end
    control = game.check_winner(computer.name, 'O')
    if control == true
      print 'Computer won!'
      break
    end
  elsif !control
    display_board(choices)
    puts "It's a draw"
  end
  count += 1
end
