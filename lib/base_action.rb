require 'gosu'

class BaseAction
  STEPS = 2

  attr_reader :element

  def self.enqueue(queue)
    STEPS.times { queue << yield if block_given? }
  end

  def initialize(rover)
    @element = rover
  end

  def ==(action)
    same_command?(action)
  end

  def same_command?(cmd)
    cmd.class == self.class
  end
end