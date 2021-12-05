a = File.readlines('daytwo_1_input.txt')

horizontal = 0
depth = 0


directions = a.map{ |x| x.strip }


directions.each do |x|
  if (x.split(' ')[0] == 'up')
    depth = depth - x.split(' ')[1].to_i
  elsif (x.split(' ')[0] == 'down')
    depth = depth + x.split(' ')[1].to_i
  elsif (x.split(' ')[0] == 'forward')
    horizontal = horizontal + x.split(' ')[1].to_i
  elsif (x.split(' ')[0] == 'back')
    horizontal = horizontal - x.split('')[1].to_i
  end
end

puts horizontal * depth



