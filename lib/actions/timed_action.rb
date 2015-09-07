require_relative 'base_action'

class TimedAction < BaseAction

  attr_accessor :delegate

  def initialize(game, element, delegate_action)
    super game, element
    @delegate = delegate_action
  end

  def expires_on(t)
    @expires_on = t
  end

  def execute
    if expired?
      delegate.execute
    else
      wait
    end
  end

  def expired?
    Time.now > @expires_on
  end

  private

  def wait
    element.action_queue << self
  end

end