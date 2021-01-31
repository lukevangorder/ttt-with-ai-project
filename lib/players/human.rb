module Players
    class Human < Player
        def move(player) #accepts a player object and asks for their move
            puts "Please enter a position"
            input = gets.strip
            input
        end
    end
end