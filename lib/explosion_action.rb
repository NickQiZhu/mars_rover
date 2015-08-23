require_relative 'base_action'
require_relative 'elimination_action'

class ExplosionAction < BaseAction

  def execute
    element.explode!
    element.enqueue_action(EliminationAction)
  end

end