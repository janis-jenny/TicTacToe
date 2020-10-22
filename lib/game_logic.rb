class Game
  attr_reader :board
  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def check_move(move, simbol)
    if @board[move] != 'X' && @board[move] != 'O' && !move.negative? && move < 9 && move.is_a?(Integer)

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
end
