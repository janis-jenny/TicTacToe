#!/usr/bin/env ruby

choices = [1, 2, 3, 4, 5, 6, 7, 8, 9]

class Player
  def initialize(name)
    @name = name
  end

  def move(current_move, choices)
    current_move = current_move.to_i - 1
    return check_move(current_move, 'X', choices)
  end
end

# Display board Method, updates automatically after every move.
def display_board(choices)
  puts ''
  puts " #{choices[0]}  | #{choices[1]}  | #{choices[2]}  "
  puts '--------------'
  puts " #{choices[3]}  | #{choices[4]}  | #{choices[5]}  "
  puts '--------------'
  puts " #{choices[6]}  | #{choices[7]}  | #{choices[8]}  "
  puts ''
end

# Method created to receive player's input.
def player_choice(player_name, choices)
  display_board(choices)
  valid_move = false
  while valid_move == false
    print 'Please make a move, choose a number: '
    valid_move = player_name.move(gets.chomp, choices)
  end
  choices
end

# Method created to check if the player move is valid!
def check_move(move, simbol, choices)
  if choices[move] != 'X' && choices[move] != 'O'
    puts 'Valid move!'
    choices[move] = simbol
    true
  else
    display_board(choices)
    puts 'Invalid move!'
    false
  end
end

# Method created to randomize a computer move.
def computer_choice(choices)
  valid_move = false
  while valid_move == false
    computer_choice = rand(0..8)
    valid_move = check_computer_move(computer_choice, 'O', choices)
  end
end

# Method created to check if the computer move is valid!
def check_computer_move(move, simbol, choices)
  if choices[move] != 'X' && choices[move] != 'O'
    puts "The computer has chosen number #{move + 1}!"
    choices[move] = simbol
    true
  else
    false
  end
end

# Method created to check if any win conditions were met.
def check_winner(player_name, choices)
  myarr = [
    [choices[0], choices[1], choices[2]], [choices[3], choices[4], choices[5]], [choices[6], choices[7], choices[8]],
    [choices[0], choices[3], choices[6]], [choices[0], choices[4], choices[8]], [choices[1], choices[4], choices[7]],
    [choices[2], choices[5], choices[8]], [choices[2], choices[4], choices[6]]
  ]

  simbol1 = 'X'
  simbol2 = 'O'

  myarr.each do |combination|
    if combination.all?(simbol1)
      display_board(choices)
      announce_winner(player_name, true)
      return true
    elsif combination.all?(simbol2)
      display_board(choices)
      announce_winner(player_name, false)
      return true
    end
  end
  false
end

# Method created to announce the winner.
def announce_winner(player_name, win_condition)
  if win_condition
    puts "Congratulations #{player_name}! You are the winner!"
  else
    puts "#{player_name} you lost!"
  end
end

# Main method created to control the game loop!
def game_engine(player_name, choices)
  count = 1
  control = false
  while count < 6 && !control
    player_choice(player_name, choices)
    control = check_winner(player_name, choices)
    if count < 5 && !control
      computer_choice(choices)
      control = check_winner(player_name, choices)
    elsif !control
      display_board(choices)
      puts "It's a draw"
    end
    count += 1
  end
end

# Program Start!
print 'What is your name? '
player = Player.new(gets.chomp)
puts "Welcome #{player}!"
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
game_engine(player_name, choices)
