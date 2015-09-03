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

  def z_index
    @z_index ||= 1
  end

  def width
    0
  end

  def height
    0
  end

  def overlap?(e)
    distance = ((x_pos - e.x_pos)**2 + (y_pos - e.y_pos)**2)**0.5
    if distance < (width + e.width)/2.0 && e.z_index == z_index
      true
    else
      false
    end
  end

  private

  def detect_movement(angle, x, y)
    same_position?(angle, x, y) ? @moved = false : @moved = true
  end

  def same_position?(angle, x, y)
    @x_pos == x && @y_pos == y && (angle.nil? || @angle == angle)
  end
end

