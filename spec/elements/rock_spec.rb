require_relative '../spec_helper.rb'

describe Rock do
  include TestHelper

  let(:game) { instance_double(Game) }
  subject(:rock) { Rock.new(game) }

  describe '#initialize' do
    it 'should load the image' do
      expect(rock.image).to be_a(Gosu::Image)
    end
  end

end
