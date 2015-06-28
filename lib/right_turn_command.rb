require_relative 'turn_command'

class RightTurnCommand < TurnCommand
  def initialize(rover)
    super rover, TURN_ANGLE
  end
end