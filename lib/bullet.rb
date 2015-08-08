require_relative 'visual_element'

class Bullet < VisualElement

  protected

  def load_image
    @image = Gosu::Image.new('media/bullet.png')
  end

end