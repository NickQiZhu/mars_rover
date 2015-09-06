require_relative 'visual_element'
require_relative 'actions/move_action'
require_relative 'actions/explosion_action'
require_relative 'explosive'

class Rock < VisualElement

  def width
    @image.width
  end

  def height
    @image.height
  end

  protected

  def load_image
    @image = Gosu::Image.new('media/rock.png')
  end

end