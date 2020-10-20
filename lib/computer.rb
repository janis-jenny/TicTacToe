class  Computer
    attr_reader :name, :simbol

    def initialize  #computer has only a given name `computer`
        @name = "computer"
        @simbol = "O"
    end 

    def computer_move #every move that is valid it is checked in class name
    
        rand(0..8) #will return a random number
          
    end
end
