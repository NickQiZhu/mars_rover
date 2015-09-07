module TestUtils
  def expect_draw(image, x, y, z)
    expect(image).to receive(:draw).with(x, y, z)
  end

  def image_double(w = 10, h = 10)
    subject.image = instance_double(Gosu::Image, width: w, height: h)
  end

  def stub_element(game, w, h, options = {})
    e = VisualElement.new(game)
    allow(e).to receive(:width).and_return(w)
    allow(e).to receive(:height).and_return(h)
    options.each do |k, v|
      allow(e).to receive(k).and_return(v)
    end
    e
  end
end