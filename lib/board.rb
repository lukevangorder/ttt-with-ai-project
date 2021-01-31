class Board
    attr_accessor :cells
    def initialize
        self.reset!
    end
    def reset!
        @cells = [" "," "," "," "," "," "," "," "," "]
    end
    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end
    def position(user_input) #Takes user input and returns the corresponding array value
        target = user_input.to_i - 1
        @cells[target]
    end
    def update(user_input, player) #takes user input and user's token and updates the board with their move
        @cells[user_input.to_i - 1] = player.token
    end
    def full? #returns true if board is full
        return @cells.include?(" ") == false
    end
    def turn_count #gives number of pieces on board as a turn count value
        turn = 0
        @cells.each do |value|
            if value != " "
                turn += 1
            end
        end
        turn
    end
    def taken?(user_input) #returns true if position is already occupied
        return self.position(user_input) != " "
    end
    def valid_move?(user_input) #returns true if move is valid
        if self.taken?(user_input) != true
            if user_input.to_i <= 9 && user_input.to_i >= 1
                true
            else
                false
            end
        else
            false
        end
    end
end