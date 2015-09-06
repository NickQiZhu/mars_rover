require_relative 'base_action'

class EliminationAction < BaseAction

  def execute
    game.remove_element element
  end

end