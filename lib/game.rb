class Game
    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    attr_accessor :board, :player_1, :player_2
    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new) #starts a new game with defaults for the board and both player objects
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end
    def current_player #uses turn_count to return which player should be inputing their move
        if @board.turn_count % 2 == 0
            return player_1
        else
            return player_2
        end
    end
    def won? #returns false for draws and returns the winning combo of indicies if there is a win
        win = false
        WIN_COMBINATIONS.each do |win_combo|
            check = []
            win_combo.each do |win_index|
                check << @board.cells[win_index]
            end
            if check == ["X","X","X"] || check == ["O","O","O"]
                return win_combo
            end
        end
        if @board.full?
            return false
        end
    end
    def draw? #return true for draw and false for won or in progress
        if self.won? || @board.full? == false
            return false
        else
            true
        end
    end
    def over? #return true for draw or win, false for in progress
        if self.won? || self.draw?
            return true
        else
            return false
        end
    end
    def winner #returns winning token or nil if no winner
        if self.won?
            return @board.cells[self.won?[0]]
        else
            return nil
        end
    end
    def turn #gets user input for current player, checks if valid and returns valid move
        input = self.current_player.move(current_player)
        unless @board.valid_move?(input)
            input = self.current_player.move(current_player)
        end 
        if @board.valid_move?(input)
            @board.update(input, self.current_player)
        end
    end
    def play #plays turn, checks if game is over then loops if it isn't
        until self.over?
            self.turn
        end
        if self.won?
            puts "Congratulations #{self.winner}!"
        elsif self.draw?
            puts "Cat's Game!"
        end
    end
end
