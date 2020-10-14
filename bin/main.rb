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
  if choices[player_move] != 'X' && choices[player_move] != 'O'
    puts 'Valid move!'
    choices[player_move] = 'X'
    check_Winner(choices, player_name)
    choices
  else
    display_Board(choices)
    puts 'Invalid move! Choose another number: '
    player_move = gets.chomp
    player_move = player_move.to_i
    player_move -= 1
    check_Move(player_move, choices, player_name)
  end
end

def computer_Choice(choices, player_name)
  computer_choice = rand(1..9)
  computer_choice -= 1
  check_computer_Move(computer_choice, choices, player_name)
end

def check_computer_Move(computer_move, choices, player_name)
  if choices[computer_move] != 'X' && choices[computer_move] != 'O'
    choices[computer_move] = 'O'
    check_Winner(choices, player_name)
    choices
  else
    computer_move = rand(1..9)
    computer_move -= 1
    check_computer_Move(computer_move, choices, player_name)
  end
end

def check_Winner(choices, player_name)
  winner = false
  if choices[0] == 'X' && choices[1] == 'X' && choices[2] == 'X'
    winner = true
    
    winner
  elsif choices[3] == 'X' && choices[4] == 'X' && choices[5] == 'X'
    winner = true
    announce_Winner(player_name, winner)
    winner
  elsif choices[6] == 'X' && choices[7] == 'X' && choices[8] == 'X'
    winner = true
    announce_Winner(player_name, winner)
    winner
  elsif choices[0] == 'X' && choices[3] == 'X' && choices[6] == 'X'
    winner = true
    announce_Winner(player_name, winner)
    winner
  elsif choices[0] == 'X' && choices[4] == 'X' && choices[8] == 'X'
    winner = true
    announce_Winner(player_name, winner)
    winner
  elsif choices[1] == 'X' && choices[4] == 'X' && choices[7] == 'X'
    winner = true
    announce_Winner(player_name, winner)
    winner
  elsif choices[2] == 'X' && choices[5] == 'X' && choices[8] == 'X'
    winner = true
    announce_Winner(player_name, winner)
    winner
  elsif choices[2] == 'X' && choices[4] == 'X' && choices[6] == 'X'
    winner = true
    announce_Winner(player_name, winner)
    winner
  else
    win_condition = false
    if choices[0] == 'O' && choices[1] == 'O' && choices[2] == 'O'
      winner = true
      announce_Winner(player_name, win_condition)
      winner
    elsif choices[3] == 'O' && choices[4] == 'O' && choices[5] == 'O'
      winner = true
      announce_Winner(player_name, win_condition)
      winner
    elsif choices[6] == 'O' && choices[7] == 'O' && choices[8] == 'O'
      winner = true
      announce_Winner(player_name, win_condition)
      winner
    elsif choices[0] == 'O' && choices[3] == 'O' && choices[6] == 'O'
      winner = true
      announce_Winner(player_name, win_condition)
      winner
    elsif choices[0] == 'O' && choices[4] == 'O' && choices[8] == 'O'
      winner = true
      announce_Winner(player_name, win_condition)
      winner
    elsif choices[1] == 'O' && choices[4] == 'O' && choices[7] == 'O'
      winner = true
      announce_Winner(player_name, win_condition)
      winner
    elsif choices[2] == 'O' && choices[5] == 'O' && choices[8] == 'O'
      winner = true
      announce_Winner(player_name, win_condition)
      winner
    elsif choices[2] == 'O' && choices[4] == 'O' && choices[6] == 'O'
      winner = true
      announce_Winner(player_name, win_condition)
      winner
    else
      return winner
    end
  end
end

def announce_Winner(player_name, win_condition)
  if win_condition
    puts "Congratulations #{player_name}! You are the winner!"
  else
    puts "#{player_name} you lost!"
  end
end

def game_Engine(choices, player_name)
  current_choices = choices
  run = false
  count = 1
  while !run && count < 5
    current_choices = player_Choice(current_choices, player_name)
    current_choices = computer_Choice(current_choices, player_name)
    count += 1
    if check_Winner(choices, player_name)
      run = true
      display_Board(choices)
    end
  end
  if run == false
    current_choices = computer_Choice(current_choices, player_name)
    display_Board(choices)
    puts "It's a draw"
  end
end

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
  game_Engine(choices, player_name)
else
  puts "Nice, let's start the game!"
  game_Engine(choices, player_name)
end
