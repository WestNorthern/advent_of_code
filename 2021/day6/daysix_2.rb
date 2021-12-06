a = File.readlines('daysix_input.txt')

input = a[0].split(",").map(&:to_i )

fish_counts = {
  0 => input.filter { |f| f == 0 }.count,
  1 => input.filter { |f| f == 1 }.count,
  2 => input.filter { |f| f == 2 }.count,
  3 => input.filter { |f| f == 3 }.count,
  4 => input.filter { |f| f == 4 }.count,
  5 => input.filter { |f| f == 5 }.count,
  6 => input.filter { |f| f == 6 }.count,
  7 => input.filter { |f| f == 7 }.count,
  8 => input.filter { |f| f == 8 }.count
}

256.times do |i|
  zero_fish = fish_counts[0];
  fish_counts[0] = fish_counts[1];
  fish_counts[1] = fish_counts[2];
  fish_counts[2] = fish_counts[3];
  fish_counts[3] = fish_counts[4];
  fish_counts[4] = fish_counts[5];
  fish_counts[5] = fish_counts[6];
  fish_counts[6] = fish_counts[7] + zero_fish;
  fish_counts[7] = fish_counts[8];
  fish_counts[8] = zero_fish;
end

p fish_counts.map { |item| item[1] }.sum
