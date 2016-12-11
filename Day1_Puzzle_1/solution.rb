def read_file(file_name)
  file = File.open(file_name, "r")
  data = file.read
  file.close
  return data.gsub("\n",'').strip.split(",")
end

def rotate(which_way, current_facing)
  if which_way == "L"
    case current_facing
      when "North"
        "West"
      when "East"
        "North"
      when "South"
        "East"
      else
        "South"
    end
  elsif
    case current_facing
      when "North"
        "East"
      when "East"
        "South"
      when "South"
        "West"
      else
        "North"
    end
  end
end

def move(spaces, location, facing)
  if facing=="North" or "South"
    if facing=="North"
      location[0] += spaces
    else
      location[0] -= spaces
    end
  else
    if facing == "East"
      location[1] += spaces
    else
      location[1] -= spaces
    end
  end
  location
end

def maneuver(instruction, location, facing)
  rotation = instruction.slice!(0)
  p "Was Facing #{facing}"
  facing = rotate(rotation, facing)
  p "After turning #{rotation} Now Facing #{facing}"
  #p "HERE #{instruction}"
  #instruction.to_int
  #p "NOW_HERE #{instruction.class}"
  p "Was at #{location}."
  new_location = move(instruction.to_i, location, facing)
  p "After moving #{instruction} spaces #{facing}, new location is #{new_location}." 
end

#-----  Begin Main Instructions -----#

directions = read_file("./input.dat")

location = [0,0]
facing = "North"

#p directions
#p location

maneuver(directions[0], location, facing)

# TODO iteration over the directions array is losing scope.

#directions.each do |move|
#  maneuver(move, location, facing)
#end

p "Final Location #{location}"

puts "End"
