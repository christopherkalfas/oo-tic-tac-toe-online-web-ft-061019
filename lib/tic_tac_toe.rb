require 'pry'
class TicTacToe 
    attr_accessor :board

    WIN_COMBINATIONS = [
     [0,1,2],
     [3,4,5],
     [6,7,8],
     [0,3,6],
     [1,4,7],
     [2,5,8],
     [0,4,8],
     [2,4,6]   
    ]    


    def initialize(board = nil)
        @board = board || Array.new(9, " ")
    end

    
    

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    
    def input_to_index(input)
        user_input = input.to_i - 1
        user_input
    end 

    def move(index, token = "X")
        @board[index] = token
    end 

    def position_taken?(index)
        @board[index] === "X" || @board[index] === "O"
    end 

    def valid_move?(index)
        true if index.between?(0,8) && !position_taken?(index)
    end 

    def turn_count
        @board.count {|token|token == "X" || token == "O"}
    end
    
    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end
    


    def turn
        puts "please select 1-9"
        input = gets.strip 
        x = input_to_index(input)
        if valid_move?(x)
            move(x, current_player)
            display_board 
        else 
            turn 
        end 
    end 

   def won?
    WIN_COMBINATIONS.find do |combo|
       @board[combo[0]] == @board[combo[1]] && 
       @board[combo[1]] == @board[combo[2]] &&
        position_taken?(combo[0])
    end 
   end 
   
   def full?
     @board.any?(' ') ? false : true
   end 

   def draw?
    full? && !(won?)
   end

   def over? 
    won? || draw?
   end 

   def winner
    won = ''
    if winner = won?
        won = @board[winner.first]
    end 
   end 
    
   def play
     until over? do
        turn
     end

     if won?
        puts "Congratulations #{winner}!"
     else draw?
        puts "Cat's Game!"
     end
     
    end 
      
end 

