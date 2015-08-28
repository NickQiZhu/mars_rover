module TestHelper
  def expect_draw(image, x, y, z)
    expect(image).to receive(:draw).with(x, y, z)
  end

  def mock_image(w = 10, h = 10)
    subject.image = instance_double(Gosu::Image, width: w, height: h)
  end

  def mock_sized_element(game, w, h)
    e = VisualElement.new(game)
    allow(e).to receive(:width).and_return(w)
    allow(e).to receive(:height).and_return(h)
    e
  end
end