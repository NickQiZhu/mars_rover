class VisualElement
  MOVEMENT_STEPS = 3

  attr_accessor :image

  def initialize(game)
    @game = game
  end

  # abstract methods

  def update
  end
end