require_relative 'base_action'
require_relative 'bullet'

class FireAction < BaseAction

  def initialize(game, vehicle)
    super game, vehicle
  end

  def execute
    game.elements << Bullet.new(game)
  end

end