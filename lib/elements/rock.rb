require_relative 'visual_element'
require_relative '../actions/move_action'
require_relative '../actions/explosion_action'
require_relative '../traits/explosive'

class Rock < VisualElement

  def initialize(game)
    super game
    @width = 90
    @height = 80
  end

  protected

  def load_image
    @image = Gosu::Image.new('media/rock.png')
  end

end