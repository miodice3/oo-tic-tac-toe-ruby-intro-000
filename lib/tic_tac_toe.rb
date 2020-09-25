class TicTacToe
  #all methods shall be within this class
  	def initialize(board = nil)
	    @board = board || Array.new(9, " ")
	  end
	  
	  def WIN_COMBINATIONS = [
	      [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6],
      ]
	  end
	  
	  def display_board(board)
	    @board = board
	      puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "-----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end
	    
    def input_to_index(input)
      @index = input.to_i - 1
    end


    def move(index, sign = "X")
      @index = index
      @sign = sign
      [index] = sign
    end
    
    def position_taken?(board, index)
      @board = board
      @index = index
      if @board[@index] == " " || @board[@index] == "" || @board[@index] == nil
            false
      elsif @board[@index] == "X" || @board[@index] == "O"
            return true
      else
        nil
      end
    end

    def valid_move?(board, index)
      @board = board
      @index = index
      @index.between?(0,8) && !position_taken?(@board, @index)
    end
    
    def turn(board)
      @board = board
      puts "Please enter 1-9:"
      @input = gets.strip
      @index = input_to_index(input)
      if valid_move?(@board, @index) == true
        move(@board, @index, @sign=current_player(@board))
        display_board(@board)
      else
       puts "your move is not valid, please try again"
       turn(board)
     end

      
    end 
  

end 