require 'gosu'

class BaseAction
  STEPS = 2

  attr_reader :rover

  def self.enqueue(queue)
    STEPS.times { queue << yield if block_given? }
  end

  def initialize(rover)
    @rover = rover
  end

  def ==(action)
    same_command?(action)
  end

  def same_command?(cmd)
    cmd.class == self.class
  end
end