require 'spec_helper.rb'

describe Game do

  describe '#initialize' do
    it 'should set window size' do
      game = Game.new(1024, 860)
      expect(game.width).to eq(1024)
      expect(game.height).to eq(860)
    end

    it 'should set default window size' do
      game = Game.new
      expect(game.width).to eq(Game::DEFAULT_WIDTH)
      expect(game.height).to eq(Game::DEFAULT_HEIGHT)
    end
  end

end
