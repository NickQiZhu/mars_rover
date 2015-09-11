module Positionable
  attr_accessor :x, :y, :angle, :width, :height

  def set_position(x, y, angle = nil)
    detect_movement(angle, x, y)

    @x = x; @y = y
    @angle = angle if angle

    self
  end

  def z_index
    @z_index ||= 1
  end

  def moved
    @moved ||= false
  end
  alias :moved? :moved

  def angle
    @angle ||= 0
  end

  def width
    @width ||= 0
  end

  def height
    @height ||= 0
  end

  def turn(degree)
    self.angle += degree
  end

  def overlap?(e)
    on_same_plane?(e) && distance_to(e) < min_distance_to(e)
  end

  private

  def detect_movement(angle, x, y)
    same_position?(angle, x, y) ? @moved = false : @moved = true
  end

  def same_position?(angle, x, y)
    @x == x && @y == y && (angle.nil? || @angle == angle)
  end

  def on_same_plane?(e)
    e.z_index == z_index
  end

  def min_distance_to(e)
    (width + e.width)/2.0
  end

  def distance_to(e)
    ((x - e.x)**2 + (y - e.y)**2)**0.5
  end
end

