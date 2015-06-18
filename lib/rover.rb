class Rover
  attr_accessor :x, :y, :image

  def initialize
    @x = @y = 0
    @image = Gosu::Image.new('media/rover.bmp')
  end

  def teleport(x, y)
    @x = x
    @y = y
  end

  def draw
    @image.draw(@x, @y, 1)
  end
end