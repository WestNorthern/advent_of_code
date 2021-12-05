a = File.readlines('dayone_1_input.txt')
return_array = []

depth_array = a.map{ |x| x.strip.to_i }

depth_array.each_with_index do |x, y|
  if (y == 0)
    return_array << "(N/A - no previous measurement)"
  elsif (x > depth_array[y - 1])
    return_array << "(increased)"
  elsif (x == depth_array[y - 1])
    return_array << "(no change)"
  elsif (x < depth_array[y - 1])
    return_array << "(decreased)"
  end  
end

increased_count = return_array.filter { |x| x == "(increased)" }.length
puts increased_count

# 1521 is the correct answer