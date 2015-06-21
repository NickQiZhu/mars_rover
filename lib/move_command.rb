class MoveCommand
  attr_accessor :x, :y

  def initialize(rover, x, y)
    @rover = rover
    @x = x
    @y = y
  end

  def execute
    @rover.position(@rover.x + x, @rover.y + y)
  end

  def ==(cmd)
    x == cmd.x && y == cmd.y
  end
end