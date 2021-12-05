a = File.readlines('dayfour_input.txt')

test_board_lose = [[22, 13, 17, 11, "X"], [8, 2, 23, 4, 24], [21, 9, 14, 16, 7], [6, 10, 3, 18, 5], [1, 12, 20, 15, 19]]
test_board_win_horizontal = [["X", "X", "X", "X", "X"], [8, 2, 23, 4, 24], [21, 9, 14, 16, 7], [6, 10, 3, 18, 5], [1, 12, 20, 15, 19]]
test_board_win_vertical = [["X", 5, 7, 8, 9], ["X", 2, 23, 4, 24], ["X", 9, 14, 16, 7], ["X", 10, 3, 18, 5], ["X", 12, 20, 15, 19]]

numbers1 = a[0].strip.split(",").map { |m| m.to_i }

def create_boards(input)
  input.shift()
  
  input.map { |a| a.strip.split(" ").map { |f| f.to_i }}.filter { |b| b != [] }.each_slice(5).to_a
end

def mark_board(board, number)
  board.each do |row|
    row.map! { |n| n == number ? "X" : n }
  end
end

def check_board(board)
  winner = false
  turned_board = board.dup.transpose.map(&:reverse)
  board.each do |row|
    winner = true if row.filter { |r| r != "X" }.length == 0
  end
  turned_board.each do |column|
    winner = true if column.filter { |r| r != "X" }.length == 0
  end
  winner
end

# Yeah!
boards1 = create_boards(a)


def play(boards, numbers)
  numbers.each do |number|
    temp = []
    puts "Playing this number " + number.to_s
    boards.each do |board|
      puts "Marking this board"
      mark_board(board, number)
      p board
      if check_board(board) == true
        score_board(board, number)
        temp << board
      end
    end
    boards = boards - temp
  end
  puts "No winner"
  return "No winner"
end

def score_board(board, number)
  puts "This board is the winner!"
  puts "It won with this number!"
  puts number
  puts "___________"
  p board
  puts "___________"
  p board.flatten.filter { |e| e != "X"}.sum * number
end


play(boards1, numbers1)