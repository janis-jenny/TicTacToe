class Game
  attr_reader :board
  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def check_move(move, simbol)
    if @board[move] != 'X' && @board[move] != 'O' && !move.negative? && move < 9

      @board[move] = simbol
      true
    else
      display_board(@board)

      false
    end
  end

  def check_winner(player_simbol)
    myarr = [
      [@board[0], @board[1], @board[2]], [@board[3], @board[4], @board[5]], [@board[6], @board[7], @board[8]],
      [@board[0], @board[3], @board[6]], [@board[0], @board[4], @board[8]], [@board[1], @board[4], @board[7]],
      [@board[2], @board[5], @board[8]], [@board[2], @board[4], @board[6]]
    ]

    myarr.each do |combination|
      return true if combination.all?(player_simbol)
    end
    false
  end

  def move(player_name, player_simbol, game)
    valid_move = false
    player_move = -1
    while valid_move == false || !player_move.is_a?(Integer) || player_move.negative?
      print "#{player_name}, please make a move, choose a number: "
      player_move = gets.chomp.to_i - 1
      valid_move = game.check_move(player_move, player_simbol)
    end
    display_board(game.board)
    control = game.check_winner(player_simbol)
    control
  end
end
