require_relative 'visual_element'

class Background < VisualElement

  protected

  def load_image
    @image = Gosu::Image.new('media/surface.png', :tileable => true)
  end

  def draw_image
    image_width = @image.width
    image_height = @image.height

    @image.draw(0, 0, z_index)
  end
end