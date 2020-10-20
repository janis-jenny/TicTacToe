class Computer
  attr_reader :name, :simbol

  # computer has only a given name `computer`
  def initialize
    @name = 'computer'
    @simbol = 'O'
  end

  # every move that is valid it is checked in class name
  def computer_move
    rand(0..8) # will return a random number
  end
end
