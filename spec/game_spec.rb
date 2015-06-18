require 'spec_helper.rb'

describe Game do
  subject(:game) { Game.new }

  after(:each) do
    game.close
  end

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
  end

  describe '#start' do
    it 'should display window' do
      expect(game).to receive(:show)
      game.start
    end
  end

  describe '#shutdow' do
    it 'should close window' do
      expect(game).to receive(:close).at_least(1)
      game.shutdown
    end
  end

end
