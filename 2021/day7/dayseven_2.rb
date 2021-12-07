a = File.readlines('dayseven_testinput.txt')

def fuel_cost(positions, max)
  lowest_cost = 1000000000
  max.times do |index|
    r = 0
    positions.each do |pos|
      r += step_cost((index - pos).abs)
    end
    if r < lowest_cost
      lowest_cost = r
    end
  end
  lowest_cost
end

def step_cost(n)
  (1..n).inject(:+) || 1
end

### Takes an embarrassing amount of time, but it works!

starting_p = a[0].split(",").map { |hp| hp.to_i }

max_p = starting_p.max

p fuel_cost(starting_p, max_p)