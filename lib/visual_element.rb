class VisualElement
  MOVEMENT_FRAMES = 1
  MOVEMENT_STEP_SIZE = -1

  attr_accessor :image

  def initialize(game)
    @game = game
  end

  # abstract methods

  def update
  end
end