a = File.readlines('daytwo_1_input.txt')

horizontal = 0
depth = 0
aim = 0


directions = a.map{ |x| x.strip }


directions.each do |x|
  if (x.split(' ')[0] == 'up')
    aim = aim - x.split(' ')[1].to_i
  elsif (x.split(' ')[0] == 'down')
    aim = aim + x.split(' ')[1].to_i
  elsif (x.split(' ')[0] == 'forward')
    horizontal = horizontal + x.split(' ')[1].to_i
    depth = depth + (aim * x.split(' ')[1].to_i)
  end
end

puts horizontal * depth
