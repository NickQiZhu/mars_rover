require_relative 'turn_command'

class LeftTurnCommand < TurnCommand
  def initialize(rover)
    super rover, -TURN_ANGLE
  end
end