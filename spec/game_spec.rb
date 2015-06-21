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
    it 'should draw all elements' do
      rovers = [instance_double(Rover), instance_double(Rover)]
      game.elements += rovers
      rovers.each { |rover| expect(rover).to receive(:draw) }
      game.draw
    end

    it 'should execute all queued commands' do
      cmd = instance_double(MoveCommand)
      game.cmd_queue << cmd
      expect(cmd).to receive(:execute)
      game.draw
    end
  end
end
