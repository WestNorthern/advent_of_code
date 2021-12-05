a = File.readlines('daythree_1_input.txt')

binaries = a.map{ |v| v.strip.split("") }

test_arr = ["00100", "11110","10110","10111","10101","01111", "00111","11100","10000","11001","00010","01010"]

ta = binaries.map(&:clone)
ta2 = binaries.map(&:clone)
# ta = test_arr.clone.map { |m| m.split("") }
# ta2 = test_arr.clone.map { |m| m.split("") }

while ta.length > 1
  (0..( ta[0].length - 1 )).each do |x|
    if ta.length == 1
      break
    end
    temp = ta.dup.transpose.map(&:reverse)
    king_bit = temp[x].count("1") >= temp[x].count("0") ? "1" : "0"
    ta.each do |y|
      if y[x] != king_bit
        ta.delete(y)
      end
    end
  end
end


while ta2.length > 1
  (0..( ta2[0].length - 1 )).each do |m|
    if ta2.length == 1
      break
    end
    temp1 = ta2.dup.transpose.map(&:reverse)
    king_bit = temp1[m].count("0") <= temp1[m].count("1") ? "0" : "1"
    ta2.each do |d|
      if d[m] != king_bit
        d << "nope"
      end
    end
    ta2 = ta2.filter { |p| !p.include?("nope") }
  end
end

puts "O2 Output Binary: " + ta.join("")
puts "CO2 Output Binary: " + ta2.join("")


puts "O2 Output Decimel: " + ta.join("").to_i(2).to_s
puts "CO2 Output Decimel: " + ta2.join("").to_i(2).to_s
p ta2.join("").to_i(2) * ta.join("").to_i(2)

# 5140689 not this either?

# 4996233 is the correct answer. somehow.