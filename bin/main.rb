#!/usr/bin/env ruby

choices = [1, 2, 3, 4, 5, 6, 7, 8, 9]

def player_Choice(choices, player_name)
  display_Board(choices)
  puts 'Please make a move, choose a number: '
  player_move = gets.chomp 
  player_move = player_move.to_i
  player_move -= 1
  choices = check_Move(player_move, choices, player_name)
  choices
end

def display_Board(choices)
  puts " #{choices[0]}  | #{choices[1]}  | #{choices[2]}  "
  puts '-----------'
  puts " #{choices[3]}  | #{choices[4]}  | #{choices[5]}  "
  puts '-----------'
  puts " #{choices[6]}  | #{choices[7]}  | #{choices[8]}  "
end

def check_Move(player_move, choices, player_name)
  if choices[player_move] === 'X' && choices[player_move] === 'O'
    puts 'Valid move!'
    choices[player_move] = 'X'
    check_Winner(choices, player_name)
    choices
  else
    display_Board(choices)
    puts 'Invalid move! Choose another number: '
    player_move = gets.chomp
    check_Move(player_move, choices, player_name)
  end
end

def computer_Choice(choices)
  computer_choice = rand(1..9)
  computer_choice -= 1
  check_computer_Move(computer_choice, choices, player_name)
end

def check_computer_Move(computer_move, choices, player_name)
  if choices[computer_move] === 'X' && choices[computer_move] === 'O'
    choices[computer_move] = 'O'
    check_Winner(choices, player_name)
    choices
  else
    computer_move = rand(1..9)
    computer_move -= 1
    check_computer_Move(computer_move, choices, player_name)
  end
end

def check_Winner(_choices, player_name)
  winner = false
  if array[0] == 'X' && array[1] == 'X' && array[2] == 'X'
    winner = true
    announce_Winner(player_name)
  elsif array[3] == 'X' && array[4] == 'X' && array[5] == 'X'
    winner = true
    announce_Winner(player_name)
  elsif array[6] == 'X' && array[7] == 'X' && array[8] == 'X'
    winner = true
    announce_Winner(player_name)
  elsif array[0] == 'X' && array[3] == 'X' && array[6] == 'X'
    winner = true
    announce_Winner(player_name)
  elsif array[0] == 'X' && array[4] == 'X' && array[8] == 'X'
    winner = true
    announce_Winner(player_name)
  elsif array[1] == 'X' && array[4] == 'X' && array[7] == 'X'
    winner = true
    announce_Winner(player_name)
  elsif array[2] == 'X' && array[5] == 'X' && array[8] == 'X'
    winner = true
    announce_Winner(player_name)
  elsif array[2] == 'X' && array[4] == 'X' && array[6] == 'X'
    winner = true
    announce_Winner(player_name)
  else
    if array[0] == 'O' && array[1] == 'O' && array[2] == 'O'
      announce_Loser(player_name)
    elsif array[3] == 'O' && array[4] == 'O' && array[5] == 'O'
      announce_Loser(player_name)
    elsif array[6] == 'O' && array[7] == 'O' && array[8] == 'O'
      announce_Loser(player_name)
    elsif array[0] == 'O' && array[3] == 'O' && array[6] == 'O'
      announce_Loser(player_name)
    elsif array[0] == 'O' && array[4] == 'O' && array[8] == 'O'
      announce_Loser(player_name)
    elsif array[1] == 'O' && array[4] == 'O' && array[7] == 'O'
      announce_Loser(player_name)
    elsif array[2] == 'O' && array[5] == 'O' && array[8] == 'O'
      announce_Loser(player_name)
    elsif array[2] == 'O' && array[4] == 'O' && array[6] == 'O'
      announce_Loser(player_name)
    else
      winner = false
      winner
    end
  end
end

def announce_Winner(player_name)
  puts "Congratulations #{player_name}! You are the winner!"
end

def announce_Loser(player_name)
  puts "#{player_name} you lost!"
end

def game_Engine(choices, player_name)
  current_choices = choices
  current_choices = player_Choice(current_choices, player_name)
  current_choices = computer_Choice(current_choices, player_name)
end

print 'What is your name?'
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
  game_Engine(choices, player_name)
else
  puts "Nice, let's start the game!"
  game_Engine(choices, player_name)
end
