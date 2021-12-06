a = File.readlines('dayfive_input.txt')

coords = a.dup.map { |line| line.strip.gsub(/\s+/, "").split("->").map { |pair| pair.split(",").map { |coord| coord.to_i }}}

def create_grid(max_x, max_y)
  grid = []
  max_y.times do
    temp = []
    max_x.times do
      temp << 0
    end
    grid << temp
  end
  grid
end

def print_grid(grid)
  grid.each do |t|
    p t
  end
end

def filter_non_hv(coords)
  temp = []
  coords.each do |row|
    p row
    if (row[0][0] == row[1][0] || row[0][1] == row[1][1])
      temp << row
    end
  end
  temp
end

def drawline(grid, coord_pair)
  p coord_pair
  constant = 0;
  lower_bound = 0;
  upper_bound = 0;
  coord_match = coord_pair[0][0] == coord_pair[1][0] ? "x" : "y"

  if coord_match == "x"
    check = []
    check << coord_pair[0][1]
    check << coord_pair[1][1]
    lower_bound = check.min
    upper_bound = check.max
    constant = coord_pair[0][0]
    x_index = constant
    y_index = lower_bound
    (upper_bound - lower_bound + 1).times do
      grid[y_index][x_index] = grid[y_index][x_index] + 1
      y_index = y_index + 1
    end
  elsif coord_match == "y"
    check = []
    check << coord_pair[0][0]
    check << coord_pair[1][0]
    constant = coord_pair[0][1]
    lower_bound = check.min
    upper_bound = check.max
    x_index = lower_bound
    y_index = constant
    (upper_bound - lower_bound + 1).times do
      grid[y_index][x_index] = grid[y_index][x_index] + 1
      x_index = x_index + 1
    end
  end  
end

new_coords = filter_non_hv(coords)

max_x = new_coords.map { |pairs| pairs.map { |x| x[0] } }.flatten.max + 1
max_y = new_coords.map { |pairs| pairs.map { |x| x[1] } }.flatten.max + 1

grid = create_grid(max_x, max_y)

new_coords.each do |line|
  drawline(grid, line)
end

print_grid(grid)

answer = grid.flatten.filter { |n| n > 1 }.count
p answer

# Got it! 7438