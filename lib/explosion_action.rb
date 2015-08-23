require_relative 'base_action'

class ExplosionAction < BaseAction

  def execute
    element.explode!
    game.remove_element element
  end

end