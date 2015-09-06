module Explosive
  IMAGE = Gosu::Image.new('media/explosion.png')

  def explode!
    @image = Explosive::IMAGE
    @exploded = true
  end

  def exploded?
    @exploded ||= false
  end
end