
require_relative "../lib/tic_tac_toe.rb"

class TicTacToe
  #all methods shall be within this class
  	def initialize(board = nil)
	    @board = board || Array.new(9, " ")
	  end
	  
	  WIN_COMBINATIONS = [
	      [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6],
      ]
	  
	  
	  def display_board            
	      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
	    
    def input_to_index(input)
      @index = input.to_i - 1
    end


    def move(index, sign = "X")
      @board[index] = sign
    end
    
    def position_taken?(board, index)
      #check bool statements, dont need if.
      if board[index] == " " || board[index] == "" || board[index] == nil
            false
      elsif board[index] == "X" || board[index] == "O"
            return true
      else
        nil
      end
    end

    def valid_move?(board, index)
      #@board = board
      #@index = index
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
  
    
    def turn_count(board)
        count = 0
          board.each do |check|
            if check == "O" || check == "X"
              count +=1
            end
        end
        return count
      end

      
      def current_player(board)
        if turn_count(board) % 2 == 0
          "X"
        elsif turn_count(board) % 2 == 1
          "O"
        else
          return
        end
      end


      def won?(board)
        WIN_COMBINATIONS.each do |win_combination|
          #puts win_combination.inspect
          win_index_1 = win_combination[0]
          win_index_2 = win_combination[1]
          win_index_3 = win_combination[2]
          
          position_1 = board[win_index_1] # load the value of the board at win_index_1
          position_2 = board[win_index_2] # load the value of the board at win_index_2
          position_3 = board[win_index_3] # load the value of the board at win_index_3    
      
          if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
           return win_combination
          end
        end
        false
      end


end 
