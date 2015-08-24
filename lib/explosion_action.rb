require_relative 'base_action'
require_relative 'timed_action'
require_relative 'elimination_action'

class ExplosionAction < BaseAction

  def execute
    element.explode!

    BaseAction.enqueue(element.action_queue) do
      action = TimedAction.new(game, element, EliminationAction.new(game, element))
      action.expires_on(Time.now + 0.3)
      action
    end
  end

end