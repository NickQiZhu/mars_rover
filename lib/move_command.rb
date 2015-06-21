class MoveCommand
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def ==(cmd)
    x == cmd.x && y == cmd.y
  end
end