require_relative 'visual_element'

class Background < VisualElement

  def initialize(game)
    super game
    @width = game.width
    @height = game.height
  end

  def z_index
    0
  end

  protected

  def load_image
    @image = Gosu::Image.new('media/surface-texture.jpg', :tileable => true)
  end

  def draw_image
    repeat_y = (@game.height.to_f / image_height).ceil
    repeat_x = (@game.width.to_f / image_width).ceil

    repeat_y.times do |y_offset|
      repeat_x.times do |x_offset|
        @image.draw(x_offset * image_width, y_offset * image_height, z_index)
      end
    end
  end

  private


  def image_height
    @image.height
  end

  def image_width
    @image.width
  end

end