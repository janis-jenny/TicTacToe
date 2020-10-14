#!/usr/bin/env ruby
# rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/AbcSize, Metrics/MethodLength, Style/GuardClause

choices = [1, 2, 3, 4, 5, 6, 7, 8, 9]

# Method created to receive player's input.
def player_choice(choices, player_name)
  display_board(choices)
  print 'Please make a move, choose a number: '
  player_move = gets.chomp
  player_move = player_move.to_i
  player_move -= 1
  choices = check_move(player_move, choices, player_name)
  choices
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

# Method created to check if the player move is valid!
def check_move(player_move, choices, player_name)
  if choices[player_move] != 'X' && choices[player_move] != 'O'
    puts 'Valid move!'
    choices[player_move] = 'X'
    choices
  else
    display_board(choices)
    print 'Invalid move! Choose another number: '
    player_move = gets.chomp
    player_move = player_move.to_i
    player_move -= 1
    check_move(player_move, choices, player_name)
  end
end

# Method created to randomize a computer move.
def computer_choice(choices, player_name)
  computer_choice = rand(1..9)
  computer_choice -= 1
  check_computer_move(computer_choice, choices, player_name)
end

# Method created to check if the computer move is valid!
def check_computer_move(computer_move, choices, player_name)
  if choices[computer_move] != 'X' && choices[computer_move] != 'O'
    choices[computer_move] = 'O'
    puts "The computer has chosen number #{computer_move + 1}!"
    choices
  else
    computer_move = rand(1..9)
    computer_move -= 1
    check_computer_move(computer_move, choices, player_name)
  end
end

# Method created to check if any win conditions were met.
def check_winner(choices)
  winner = false
  if choices[0] == 'X' && choices[1] == 'X' && choices[2] == 'X'
    winner = true
  elsif choices[3] == 'X' && choices[4] == 'X' && choices[5] == 'X'
    winner = true
  elsif choices[6] == 'X' && choices[7] == 'X' && choices[8] == 'X'
    winner = true
  elsif choices[0] == 'X' && choices[3] == 'X' && choices[6] == 'X'
    winner = true
  elsif choices[0] == 'X' && choices[4] == 'X' && choices[8] == 'X'
    winner = true
  elsif choices[1] == 'X' && choices[4] == 'X' && choices[7] == 'X'
    winner = true
  elsif choices[2] == 'X' && choices[5] == 'X' && choices[8] == 'X'
    winner = true
  elsif choices[2] == 'X' && choices[4] == 'X' && choices[6] == 'X'
    winner = true
  elsif choices[0] == 'O' && choices[1] == 'O' && choices[2] == 'O'
    winner = true
  elsif choices[3] == 'O' && choices[4] == 'O' && choices[5] == 'O'
    winner = true
  elsif choices[6] == 'O' && choices[7] == 'O' && choices[8] == 'O'
    winner = true
  elsif choices[0] == 'O' && choices[3] == 'O' && choices[6] == 'O'
    winner = true
  elsif choices[0] == 'O' && choices[4] == 'O' && choices[8] == 'O'
    winner = true
  elsif choices[1] == 'O' && choices[4] == 'O' && choices[7] == 'O'
    winner = true
  elsif choices[2] == 'O' && choices[5] == 'O' && choices[8] == 'O'
    winner = true
  elsif choices[2] == 'O' && choices[4] == 'O' && choices[6] == 'O'
    winner = true
  end
  winner
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
def game_engine(choices, player_name)
  current_choices = choices
  count = 1
  control = false
  while count < 6 && !control
    current_choices = player_choice(current_choices, player_name)
    if check_winner(choices)
      control = true
      display_board(choices)
      announce_winner(player_name, control)
    end
    if count < 5 && !control
      current_choices = computer_choice(current_choices, player_name)
      if check_winner(choices)
        display_board(choices)
        announce_winner(player_name, control)
        control = true
      end
    end
    count += 1
  end
  if count == 6 && !control
    display_board(choices)
    puts "It's a draw"
  end
end

# Program Start!
print 'What is your name? '
player_name = gets.chomp
puts "Welcome #{player_name}!"
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
game_engine(choices, player_name)
