module ImageHelper
  def expect_draw(image, x, y, z)
    expect(image).to receive(:draw).with(x, y, z)
  end

  def mock_image(w = 10, h = 10)
    subject.image = instance_double(Gosu::Image, width: w, height: h)
  end
end