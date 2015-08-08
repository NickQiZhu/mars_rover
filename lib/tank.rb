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

  def move
    enqueue_action(MoveAction)
  end

  def turn_left
    enqueue_action(LeftTurnAction)
  end

  def turn_right
    enqueue_action(RightTurnAction)
  end

  def fire
    enqueue_action(FireAction)
  end

  def update(mouse_x, mouse_y)
    action_map = {Gosu::KbUp => :move,
                      Gosu::KbLeft => :turn_left,
                      Gosu::KbRight => :turn_right,
                      Gosu::KbSpace => :fire}

    action_map.each_key do |key|
      action = action_map[key]
      send(action) if pressed?(key)
    end
  end

  protected

  def load_image
    @image = Gosu::Image.new('media/tank.png')
  end

  private

  def enqueue_action(action_class)
    BaseAction.enqueue(@action_queue) { action_class.new(game, self) }
  end

end