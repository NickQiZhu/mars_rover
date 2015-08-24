module Positionable
  attr_accessor :x_pos, :y_pos, :angle

  def set_position(x, y, angle = nil)
    detect_movement(angle, x, y)

    @x_pos = x
    @y_pos = y
    @angle = angle if angle

    self
  end

  def turn(degree)
    self.angle += degree
  end

  def moved?
    @moved ||= false
  end

  private

  def detect_movement(angle, x, y)
    same_position?(angle, x, y) ? @moved = false : @moved = true
  end

  def same_position?(angle, x, y)
    @x_pos == x && @y_pos == y && (angle.nil? || @angle == angle)
  end
end

