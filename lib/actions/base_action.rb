require 'gosu'

class BaseAction
  STEPS = 1

  attr_reader :game, :element

  def self.enqueue(queue)
    STEPS.times { queue << yield if block_given? }
  end

  def initialize(game, element)
    @game = game
    @element = element
  end

  def ==(action)
    same_command?(action)
  end

  def same_command?(cmd)
    cmd.class == self.class
  end

  def execute
    # abstract method
  end
end