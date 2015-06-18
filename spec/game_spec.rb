require 'spec_helper.rb'

describe Game do
  subject(:game) { Game.new }

  describe '#initialize' do
    it 'should set window size' do
      expect(game.width).to eq(Game::DEFAULT_WIDTH)
      expect(game.height).to eq(Game::DEFAULT_HEIGHT)
    end

    it 'should set caption' do
      expect(game.caption).to_not be_nil
    end

    it 'should set background image' do
      expect(game.background_image).to be_a(Gosu::Image)
    end

    it 'should create rover' do
      expect(game.rover).to be_a(Rover)
    end
  end

  describe '#start' do
    it 'should display window' do
      expect(game).to receive(:show)
      game.start
    end
  end

  describe '#shutdow' do
    it 'should close window' do
      expect(game).to receive(:close)
      game.shutdown
    end
  end

  describe '#draw' do
    it 'should draw background image and rover' do
      expect(game.background_image).to receive(:draw).with(0, 0, 0)
      expect(game.rover).to receive(:draw)
      game.draw
    end
  end
end
