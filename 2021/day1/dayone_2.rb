a = File.readlines('dayone_1_input.txt')
return_array = []

depth_array = a.map{ |x| x.strip.to_i }

depth_array.each_with_index do |x, y|
  if (y == 1998)
    break
  elsif (y == 0)
    return_array << "(N/A - no previous measurement)"
  elsif ((depth_array[y - 1] + depth_array[y] + depth_array[y + 1]) < (depth_array[y] + depth_array[y + 1] + depth_array[y + 2]))
    return_array << "(increased)"
  elsif ((depth_array[y - 1] + depth_array[y] + depth_array[y + 1]) == (depth_array[y] + depth_array[y + 1] + depth_array[y + 2]))
    return_array << "(no change)"
  elsif ((depth_array[y - 1] + depth_array[y] + depth_array[y + 1]) > (depth_array[y] + depth_array[y + 1] + depth_array[y + 2]))
    return_array << "(decreased)"
  end  
end

increased_count = return_array.filter { |x| x == "(increased)" }.length
puts increased_count

# 1543 is the correct answer
