require_relative 'base_action'
require_relative '../elements/bullet'

class FireAction < BaseAction

  def initialize(game, element)
    super game, element
  end

  def execute
    game.add_element fire_bullet
  end

  private

  def fire_bullet
    bullet = Bullet.new(game)
    x = element.x_pos + Gosu::offset_x(element.angle, element.width)
    y = element.y_pos + Gosu::offset_y(element.angle, element.height)
    bullet.set_position(x, y, element.angle)
    bullet
  end

end