require 'spec_helper.rb'

describe Rock do
  include ImageHelper

  let(:game) { instance_double(Game) }
  subject(:rock) { Rock.new(game) }

  it 'should has width set' do
    expect(rock.width).to be > 0
  end

  it 'should has height set' do
    expect(rock.height).to be > 0
  end

  describe '#initialize' do
    it 'should load the image' do
      expect(rock.image).to be_a(Gosu::Image)
    end
  end

end
