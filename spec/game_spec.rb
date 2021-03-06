require 'spec_helper.rb'

describe Game do
  include TestUtils

  subject(:game) { Game.new }

  describe '#initialize' do
    it 'should set window size' do
      expect(game.width).to eq(Game::DEFAULT_WIDTH)
      expect(game.height).to eq(Game::DEFAULT_HEIGHT)
    end

    it 'should set caption' do
      expect(game.caption).to_not be_nil
    end
  end

  describe '#setup' do
    before(:each) { game.setup }

    [Background, Tank, Mouse].each do |element_class|
      it "should set #{element_class} element" do
        has_element_by_class?(game, element_class)
      end
    end

    def has_element_by_class?(game, element_class)
      expect(game.elements.select { |e| e.is_a? element_class }.size).to eq(1)
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

  context 'cascade method' do
    let(:rovers) { [instance_double(Tank), instance_double(Tank)] }

    before(:each) { rovers.each { |r| game.add_element r } }

    describe '#draw' do
      it 'should draw all elements' do
        rovers.each { |rover| expect(rover).to receive(:draw) }
        game.draw
      end
    end

    describe '#update' do
      it 'should trigger #update on all visual elements' do
        mouse_x = 10; mouse_y = 15
        allow(game).to receive(:mouse_x).and_return(mouse_x)
        allow(game).to receive(:mouse_y).and_return(mouse_y)
        rovers.each { |rover| expect(rover).to receive(:update).with(mouse_x, mouse_y) }
        game.update
      end
    end
  end

  describe '#button_down' do
    it 'should shutdown the game is esc is pressed' do
      expect(game).to receive(:shutdown)
      game.button_down(Gosu::KbEscape)
    end
  end

  describe '#collision?' do
    let(:same_plane_element) { stub_element(game, 10, 10) }
    let(:diff_plane_element) { stub_element(game, 10, 10, z_index: 2) }

    it 'should return true if two colliding element on the same plane found' do
      game.add_element same_plane_element
      e = stub_element(game, 5, 5)
      expect(game.collision?(e)).to be_truthy
    end

    it 'should return false if the colliding element is excluded' do
      game.add_element same_plane_element
      e = stub_element(game, 5, 5)
      expect(game.collision?(e, [same_plane_element])).to be_falsey
    end

    it 'should return false if only one element is on the plane' do
      game.add_element same_plane_element
      expect(game.collision?(same_plane_element)).to be_falsey
    end

    it 'should return false if no colliding element found on the same plane' do
      game.add_element diff_plane_element
      e = stub_element(game, 5, 5)
      expect(game.collision?(e)).to be_falsey
    end
  end
end
