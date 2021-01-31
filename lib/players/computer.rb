module Players
    class Computer < Player
        def move(board) #accepts a board object and generates a move
            if board.cells[5] == " "
                "5"
            else
                open_corners = []
                open_sides = []
                board.cells.each do |cell|
                    if cell == " " && [0,2,6,8].include?(cell)
                        open_corners << cell
                    elsif cell == " " && [1,3,5,7].include?(cell)
                        open_sides << cell
                    end
                end
                if open_corners.length > 0
                    return "#{open_corners.sample + 1}"
                else
                    return "#{open_sides.sample + 1}"
                end
            end
        end
    end
end