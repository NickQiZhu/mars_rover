require 'spec_helper.rb'

describe Background do
  subject(:background) { Background.new }

  describe '#initialize' do
    it 'should load background image' do
      expect(background.image).to be_a(Gosu::Image)
    end
  end

  describe '#draw' do
    it 'should draw background image' do
      image = instance_double(Gosu::Image)
      background.image = image
      expect(image).to receive(:draw).with(0,0,0)
      background.draw
    end
  end
end
