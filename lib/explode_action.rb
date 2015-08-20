require_relative 'base_action'

class ExplodeAction < BaseAction

  def execute
    game.remove_element element
  end

end