require './movements.rb'

def read_file(file_name)
  file = File.open(file_name, "r")
  data = file.read
  file.close
  return data.gsub("\n",'').strip.split(", ")
end

#-----  Begin Main Instructions -----#

directions = read_file("./input.dat")

# directions = ["L5", "R5", "L5", "L3"]

# p directions

movements = Movements.new

directions.each do |direction|
  movements.maneuver(direction)
end

p "#{movements.location}"

p "X coordinate #{movements.location[0]}, Y coordinate #{movements.location[1]}"

distance = movements.location[0].abs + movements.location[1].abs

p "The distance to the Easter Bunny is #{distance}."

puts "End"
