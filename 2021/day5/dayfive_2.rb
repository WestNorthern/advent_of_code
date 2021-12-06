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

def draw_line(grid, coord_pair)
  starting_point_x = coord_pair[0][0]
  ending_point_x = coord_pair[1][0]
  starting_point_y = coord_pair[0][1]
  ending_point_y = coord_pair[1][1]

  x_min = [starting_point_x, ending_point_x].min
  x_max = [starting_point_x, ending_point_x].max
  y_min = [starting_point_y, ending_point_y].min
  y_max = [starting_point_y, ending_point_y].max

  x_range = x_max - x_min
  y_range = y_max - y_min
  larger_range = [x_range, y_range].max

  x_index = starting_point_x
  y_index = starting_point_y

  if x_range != 0 && x_range == y_range
    (x_range + 1).times do
      grid[y_index][x_index] = grid[y_index][x_index] + 1
      if starting_point_x < ending_point_x
        x_index = x_index + 1
      else
        x_index = x_index - 1
      end
      if starting_point_y < ending_point_y
        y_index = y_index + 1
      else
        y_index = y_index - 1
      end
    end
  elsif x_range == 0
    (y_range + 1).times do
      grid[y_index][x_index] = grid[y_index][x_index] + 1
      if starting_point_y < ending_point_y
        y_index = y_index + 1
      else
        y_index = y_index - 1
      end
    end
  elsif y_range == 0
    (x_range + 1).times do
      grid[y_index][x_index] = grid[y_index][x_index] + 1
      if starting_point_x < ending_point_x
        x_index = x_index + 1
      else
        x_index = x_index - 1
      end
    end
  else 
    puts "Something weird happened"
  end

end

new_coords = filter_non_45(coords)

max_x = new_coords.map { |pairs| pairs.map { |x| x[0] } }.flatten.max + 1
max_y = new_coords.map { |pairs| pairs.map { |x| x[1] } }.flatten.max + 1

grid = create_grid(max_x, max_y)

new_coords.each do |line|
  draw_line(grid, line)
end

print_grid(grid)

answer = grid.flatten.filter { |n| n >= 2 }.count
p answer

# woot 21406
