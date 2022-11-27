class TicTacToe
    def initialize 
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

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

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts " ----------- "
        puts "  #{@board[3]} | #{@board[4]} | #{@board[5]} " 
        puts " ----------- "
        puts "  #{@board[6]} | #{@board[7]} | #{@board[8]} " 
    end

    def input_to_index num
        num.to_i - 1
    end

    def move board_index, token = "X"
        @board[board_index] = token
    end

    def position_taken? board_index
        @board[board_index] == " " ? false : true
    end

    def valid_move? position 
        if position > -1 && position < 10 && @board[position] == " "
            true
        else
            false
        end
    end

    def turn_count
        @board.select {|elem| elem != " "}.size
    end

    def current_player
        turn_count.even? ? "X" : "O"
    end

    def turn
        puts "Enter a number between 1 and 9" 
        user_input = gets
        index = input_to_index(user_input)
        if valid_move?(index)
            @board[index] = current_player()
            display_board()
        else
        puts "Invalid position"
        turn()
        end
    end

    def won?
        WIN_COMBINATIONS.any? do |elem|
           if position_taken?(elem[0]) && @board[elem[0]] == @board[elem[1]] && @board[elem[1]] == @board[elem[2]]
               return elem
            end
        end
    end

    def full?
        @board.all? {|elem| elem != " "}
    end

    def draw? 
        !won?() && full?() ? true : false
    end

    def over?
        won?() || full?() || draw?() ? true : false
    end

    def winner 
       won?() ? @board[won?()[0]] : nil
    end

    def play
        turn() until over?()
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end

end
