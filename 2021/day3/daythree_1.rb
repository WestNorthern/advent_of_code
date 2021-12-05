a = File.readlines('daythree_1_input.txt')

gamma = ""
epsilon = ""


binaries = a.map{ |x| x.strip.split('') }

# p binaries

nb = binaries.transpose.map(&:reverse)

ur = []

nb.each do |x|
  if x.count("1") > x.count("0")
    gamma << "1"
    epsilon << "0"
  else
    gamma << "0"
    epsilon << "1"
  end
end

p gamma.to_i(2)
p epsilon.to_i(2)

p gamma.to_i(2) * epsilon.to_i(2)
