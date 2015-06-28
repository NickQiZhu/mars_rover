require 'spec_helper.rb'

describe VisualElement do

  describe '#draw' do
    let(:element) { VisualElement.new(instance_double(Game)) }
    let(:cmd) { instance_double(MoveCommand) }

    before(:each) do
      expect(cmd).to receive(:execute)
      element.action_queue << cmd
    end

    it 'should execute first queued commands' do
      element.action_queue << instance_double(MoveCommand)
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

end
