require_relative 'base_action'

class ExplodeAction < BaseAction

  def execute
    game.elements.delete(element)
  end

end