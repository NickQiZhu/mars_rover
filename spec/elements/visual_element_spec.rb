require_relative '../spec_helper.rb'

describe VisualElement do

  include TestHelper

  let(:game) { instance_double(Game) }
  let(:element) { VisualElement.new(game) }

  describe '#draw' do
    let(:action) { instance_double(BaseAction) }

    before(:each) do
      expect(action).to receive(:execute)
      element.action_queue << action
    end

    it 'should execute first queued commands' do
      element.action_queue << instance_double(BaseAction)
      element.draw
    end

    it 'should consume queued command after execution' do
      element.draw
      expect(element.action_queue).to be_empty
    end

    it 'should invoke #draw_image method' do
      expect(element).to receive(:draw_image)
      element.draw
    end
  end

  describe '#draw_image' do
    let(:x) { 10 }; let(:y) { 15 }; let(:angle) { 4 }

    it 'should draw image' do
      element.set_position x, y, angle
      element.image = instance_double(Gosu::Image)
      expect(element.image).to receive(:draw_rot).with(x, y, element.z_index, angle)
      element.draw
    end
  end

end
