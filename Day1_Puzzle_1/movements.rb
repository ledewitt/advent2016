class Movements

  def initialize
    @location = [0,0]
    @facing = "North"
  end

  attr_reader :location

  def rotate(turning)
    if turning == "L"
      case @facing
        when "North"
          @facing = "West"
        when "East"
          @facing = "North"
        when "South"
          @facing = "East"
        else
          @facing = "South"
      end
    else
      case @facing
        when "North"
          @facing = "East"
        when "East"
          @facing = "South"
        when "South"
          @facing = "West"
        else
          @facing = "North"
      end
    end
  end

  def move(spaces)
    # p "In move what is facing?  #{@facing}"
    # p "I am suppose to move #{spaces}"
    case @facing
      when "North"
        @location[0] += spaces
      when "South"
        @location[0] -= spaces
      when "East"
        @location[1] += spaces
      else
        @location[1] -= spaces
    end
  end

  def maneuver(direction)
    p "This is the directions I was given: #{direction}"
    rotation = direction.slice!(0)
    p "Was Facing #{@facing}"
    rotate(rotation)
    p "After turning #{rotation} Now Facing #{@facing}"
    p "Was at #{location}."
    move(direction.to_i)
    p "After moving #{direction} spaces #{@facing}, new location is #{@location}." 
  end
end
