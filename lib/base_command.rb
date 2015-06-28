require 'gosu'

class BaseCommand
  STEPS = 2

  attr_reader :rover

  def initialize(rover)
    @rover = rover
  end

  def same_command?(cmd)
    cmd.class == self.class
  end
end