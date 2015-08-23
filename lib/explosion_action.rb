require_relative 'base_action'

class ExplosionAction < BaseAction

  def execute
    element.explode!
  end

end