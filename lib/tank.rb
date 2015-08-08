require_relative 'visual_element'
require_relative 'move_action'
require_relative 'left_turn_action'
require_relative 'right_turn_action'
require_relative 'fire_action'

class Tank < VisualElement
  Z_INDEX = 1

  def initialize(game)
    super game
    set_position 320, 240, 0
  end

  def z_index
    1
  end

  def move
    BaseAction.enqueue(@action_queue) { MoveAction.new(game, self) }
  end

  def turn_left
    BaseAction.enqueue(@action_queue) { LeftTurnAction.new(game, self) }
  end

  def turn_right
    BaseAction.enqueue(@action_queue) { RightTurnAction.new(game, self) }
  end

  def fire
    BaseAction.enqueue(@action_queue) { FireAction.new(game, self) }
  end

  def update(mouse_x, mouse_y)
    key_action_map = {Gosu::KbUp => :move, Gosu::KbLeft => :turn_left, Gosu::KbRight => :turn_right, Gosu::KbSpace => :fire}

    key_action_map.each_key do |key|
      action = key_action_map[key]
      send(action) if pressed?(key)
    end
  end

  protected

  def load_image
    @image = Gosu::Image.new('media/tank.png')
  end

end