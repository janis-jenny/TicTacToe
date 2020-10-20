
class Game
    attr_reader :board
    def initialize
        @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end
    def check_move(move, simbol)
        if @board[move] != 'X' && @board[move] != 'O'
          
          @board[move] = simbol
          true
        else
          display_board(@board)
         
          false
        end
    end

    def check_winner(player_name, player_simbol) #para comparar el simbolo q le mandas
        myarr = [
        [@board[0], @board[1], @board[2]], [@board[3], @board[4], @board[5]], [@board[6], @board[7], @board[8]],
        [@board[0], @board[3], @board[6]], [@board[0], @board[4], @board[8]], [@board[1], @board[4], @board[7]],
        [@board[2], @board[5], @board[8]], [@board[2], @board[4], @board[6]]
    ]
    
    myarr.each do |combination|
        if combination.all?(player_simbol) 
        return true
        end
    end
    false
    end

end
#u ask to the class if the combination is valid or not it will return true or false but in main.rb u check that and it will respond if the player won or not
#u are grouping logic u can show here puts or print that goes on main, u ask something to the class if it won or not fot the games rules there