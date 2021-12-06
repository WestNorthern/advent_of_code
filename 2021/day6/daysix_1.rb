a = File.readlines('daysix_input.txt')

first_fish_ages = a[0].split(",").map { |age| age.to_i }

p first_fish_ages

cool_school = []

first_fish_ages.each do |fish_age|
  cool_school << { age: fish_age }
end

def create_new_fish(number, school)
  number.times do
    school << { age: 9 }
  end
end

def advance_days(number_of_days, school)
  number_of_days.times do
    new_fish_count = school.filter { |f| f[:age] == 0 }.count
    create_new_fish(new_fish_count, school)
    school.each do |fish|
      if fish[:age] > 0
        fish[:age] = fish[:age] - 1
      else
        fish[:age] = 6
      end
    end
    school_play(school)
  end
  school
end

def school_play(school)
  p school.map { |gen| gen[:age] }
end

advance_days(256, cool_school)

answer = cool_school.count

p answer

