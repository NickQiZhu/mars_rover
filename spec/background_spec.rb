require 'spec_helper.rb'

describe Background do
  let(:game) { instance_double(Game, width: 9, height: 9) }
  subject(:background) { Background.new(game) }

  describe '#initialize' do
    it 'should load background image' do
      expect(background.image).to be_a(Gosu::Image)
    end
  end

  describe '#draw' do
    let(:image) { instance_double(Gosu::Image) }

    before(:each) do
      background.image = image
    end

    it 'should draw background image if image is larger than game size' do
      expect(image).to receive(:width).and_return(11)
      expect(image).to receive(:height).and_return(10)
      expect(image).to receive(:draw).with(0, 0, background.z_index)
      background.draw
    end

    it 'should draw background image in tiles if image is small in both width and height' do
      expect(image).to receive(:width).and_return(3)
      expect(image).to receive(:height).and_return(3)
      expect(image).to receive(:draw).with(0, 0, background.z_index)
      expect(image).to receive(:draw).with(3, 0, background.z_index)
      expect(image).to receive(:draw).with(6, 0, background.z_index)
      expect(image).to receive(:draw).with(0, 3, background.z_index)
      expect(image).to receive(:draw).with(3, 3, background.z_index)
      expect(image).to receive(:draw).with(6, 3, background.z_index)
      expect(image).to receive(:draw).with(0, 6, background.z_index)
      expect(image).to receive(:draw).with(3, 6, background.z_index)
      expect(image).to receive(:draw).with(6, 6, background.z_index)
      background.draw
    end
  end
end
