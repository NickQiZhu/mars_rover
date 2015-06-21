class Background
  attr_accessor :image

  def initialize
    @image = Gosu::Image.new('media/surface.png', :tileable => true)
  end

  def draw
    @image.draw(0, 0, 0)
  end
end