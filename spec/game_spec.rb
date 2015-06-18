require 'spec_helper.rb'

describe Game do
  subject(:game) { Game.new }

  let(:window) {
    double(:window, :caption= => nil)
  }

  context 'class' do
    describe '.new_window' do
      it 'should set caption' do
        expect(Gosu::Window).to receive(:new).and_return(window)
        expect(window).to receive(:caption=)
        Game.new_window(Game::DEFAULT_WIDTH, Game::DEFAULT_HEIGHT)
      end
    end
  end

  context 'object' do
    before(:each) {
      allow(Game).to receive(:new_window).and_return(window)
    }

    describe '#initialize' do
      it 'should make Gosu window' do
        expect(game.window).to eq(window)
      end

      it 'should set background image' do
        expect(game.background_image).to be_a(Gosu::Image)
      end
    end

    describe '#start' do
      it 'should display window' do
        expect(window).to receive(:show)
        game.start
      end
    end

    describe '#shutdow' do
      it 'should close window' do
        expect(window).to receive(:close)
        game.shutdown
      end
    end

    describe '#draw' do
      xit 'should draw background image' do
        expect(game.background_image).to receive(:draw).with(0, 0, 0)
        game.draw
      end
    end
  end
end
