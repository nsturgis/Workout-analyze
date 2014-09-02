class Workout
  attr_reader :id, :date
  def initialize(id, data)
    @id = id
    @date = data[id][:date]
    @exercise = data[id][:exercises]
  end
def find_category
category = []
@exercise.each do |row|
 category << row[:category]
end
total = category.count
if category.count{|x| x == "strength"}.to_f/total.to_f >= 0.50
  return "strength"
elsif category.count{|x| x== "cardio"}.to_f/total.to_f >= 0.50
  return "cardio"
else
  return "other"
end
end

def duration
total_time = 0
@exercise.each do |row|
  total_time += row[:duration_in_min]
end
return total_time
end

def calories_burned
total_cals_burned= 0
@exercise.each do |row|
  calories= 0
  case
  when row[:intensity] == "high"
    calories = 10 * row[:duration_in_min]
  when row[:intensity] == "medium"
    calories = 8 * row[:duration_in_min]
  when row[:intensity] == "low" || row[:category] == "strength"
    calories = 5 * row[:duration_in_min]
  else
    calories = 6 * row[:duration_in_min]
  end
  total_cals_burned +=calories
end
return total_cals_burned
end
end

