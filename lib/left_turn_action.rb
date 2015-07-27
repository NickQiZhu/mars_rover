require_relative 'turn_action'

class LeftTurnAction < TurnAction
  def initialize(game, rover)
    super game, rover, -TURN_ANGLE
  end
end