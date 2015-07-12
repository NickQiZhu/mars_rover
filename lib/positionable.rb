module Positionable
  attr_reader :x_pos, :y_pos, :angle

  def position(x, y, angle = nil)
    @x_pos = x
    @y_pos = y
    @angle = angle if angle
  end
end