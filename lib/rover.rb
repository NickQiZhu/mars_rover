class Rover
  attr_reader :x, :y, :image

  def initialize(game)
    @game = game
    @x = @y = 0
    @image = Gosu::Image.new('media/rover.bmp')
  end

  def position(x, y)
    @x = x
    @y = y
  end

  def draw
    image.draw(@x, @y, 1)
  end

  def move
    3.times{
      @game.cmd_queue << MoveCommand.new(self, 0, -5)
    }
  end
end