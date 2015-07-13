module Positionable
  attr_reader :x_pos, :y_pos, :angle

  def set_position(x, y, angle = nil)
    @x_pos = x
    @y_pos = y
    @angle = angle if angle
  end

  def turn(degree)
    @angle += degree
  end
end