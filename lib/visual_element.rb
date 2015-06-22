class VisualElement
  MOVEMENT_STEPS = 3
  MOVEMENT_STEP_SIZE = -1

  attr_accessor :image

  def initialize(game)
    @game = game
  end

  # abstract methods

  def update
  end
end