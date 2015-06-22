require_relative 'base_command'

class MoveCommand < BaseCommand
  attr_accessor :x, :y

  def initialize(rover, x, y)
    super rover
    @x = x
    @y = y
  end

  def execute
    @rover.position(@rover.x + x, @rover.y + y)
  end

  def ==(cmd)
    same_command?(cmd) && x == cmd.x && y == cmd.y
  end

end