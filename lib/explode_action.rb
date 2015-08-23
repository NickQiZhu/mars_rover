require_relative 'base_action'

class ExplodeAction < BaseAction

  def execute
    element.explode!
    game.remove_element element
  end

end