require_relative 'visual_element'
require_relative 'actions/move_action'
require_relative 'actions/left_turn_action'
require_relative 'actions/right_turn_action'
require_relative 'actions/fire_action'

class Tank < VisualElement
  FIRING_INTERVAL = 0.5

  def initialize(game)
    super game
    set_position 220, 640, 0
    gun_ready!
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

  def gun_ready?
    Time.now - @fired_at >= FIRING_INTERVAL
  end

  def fire
    if gun_ready?
      @fired_at = Time.now
      enqueue_action(FireAction)
    end
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

  def gun_ready!
    @fired_at = Time.now - FIRING_INTERVAL
  end

end