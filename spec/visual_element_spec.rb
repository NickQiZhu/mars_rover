require 'spec_helper.rb'

describe VisualElement do

  include TestHelper

  let(:game) { instance_double(Game) }
  let(:element) { VisualElement.new(game) }

  it 'should set default size to 0x0' do
    expect(element.width).to eq(0)
    expect(element.height).to eq(0)
  end

  describe '#draw' do
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

  describe '#overlap?' do
    let(:e1) { stub_element(game, 10, 10) }
    let(:e2) { stub_element(game, 4, 4) }
    let(:e_on_diff_plane) { stub_element(game, 4, 4, z_index: 2) }

    it 'should return false if elements have no overlap' do
      e1.set_position(1, 1)
      e2.set_position(20, 20)
      expect(e1.overlap?(e2)).to be_falsey
    end

    it 'should return true if elements have overlap' do
      e1.set_position(1, 1)
      e2.set_position(5, 5)
      expect(e1.overlap?(e2)).to be_truthy
    end

    it 'should return false if elements have overlap on different planes' do
      e1.set_position(1, 1)
      e_on_diff_plane.set_position(5, 5)
      expect(e1.overlap?(e_on_diff_plane)).to be_falsey
    end

    it 'should return true if two elements are just touching' do
      e1.set_position(0, 0)
      e2.set_position(0, 6)
      expect(e1.overlap?(e2)).to be_truthy
    end

    it 'should return true if two elements are close but not touching' do
      e1.set_position(0, 0)
      e2.set_position(0, 15)
      expect(e1.overlap?(e2)).to be_falsey
    end
  end

end
