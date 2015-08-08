require 'spec_helper.rb'

describe VisualElement do

  describe '#draw' do
    let(:element) { VisualElement.new(instance_double(Game)) }
    let(:action) { instance_double(MoveAction) }

    let(:x) { 10 }; let(:y) { 15 }; let(:angle) { 4 }

    before(:each) do
      expect(action).to receive(:execute)
      element.action_queue << action

      element.image = instance_double(Gosu::Image)
      allow(element.image).to receive(:draw_rot)
      element.set_position x, y
      element.turn(angle)
    end

    it 'should execute first queued commands' do
      element.action_queue << instance_double(MoveAction)
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

    it 'should draw image' do
      expect(element.image).to receive(:draw_rot).with(x, y, element.z_index, angle)
      element.draw
    end
  end

end
