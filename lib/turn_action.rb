require_relative 'base_action'

class TurnAction < BaseAction

  TURN_ANGLE = 2

  attr_accessor :degree

  def initialize(game, rover, degree)
    super game, rover
    @degree = degree
  end

  def execute
    @element.turn(@degree)
  end

  def ==(action)
    same_command?(action) && degree == action.degree
  end

end