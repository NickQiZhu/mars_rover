class VisualElement
  attr_accessor :image

  def initialize(game)
    @game = game
  end

  # abstract methods

  def update
  end
end