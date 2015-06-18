require 'spec_helper.rb'

describe Game do

  describe '#start' do
    it 'should set window size' do
      game = Game.new(1024, 860)
      expect(game.width).to eq(1024)
      expect(game.height).to eq(860)
    end
  end

end
