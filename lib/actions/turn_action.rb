require_relative 'base_action'

class TurnAction < BaseAction

  TURN_ANGLE = 1

  attr_accessor :degree

  def initialize(game, vehicle, degree)
    super game, vehicle
    @degree = degree
  end

  def execute
    @element.turn(@degree)
  end

  def ==(action)
    same_command?(action) && degree == action.degree
  end

end