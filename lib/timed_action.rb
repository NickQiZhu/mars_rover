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
    if expired?
      delegate_action.execute
    else
      element.action_queue << self
    end
  end

  def expired?
    Time.now > @expires_on
  end

end