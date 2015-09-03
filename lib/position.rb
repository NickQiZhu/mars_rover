require_relative 'positionable'

class Position
  include Positionable

  def initialize(x, y, z)
    set_position(x, y)
    @z_index = z
  end
end