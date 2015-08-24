require_relative 'base_action'

class TimedAction < BaseAction

  attr_accessor :delegate_action

  def initialize(game, element, delegate_action)
    super game, element
    @delegate_action = delegate_action
  end

  def expires_on(t)
    @expires_on = t
  end

  def execute
    delegate_action.execute if expired?
  end

  def expired?
    Time.now > @expires_on
  end

end