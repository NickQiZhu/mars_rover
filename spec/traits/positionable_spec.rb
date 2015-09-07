require_relative '../spec_helper.rb'

describe Positionable do
  let(:klass) { Class.new { include Positionable } }
  subject(:object) { klass.new }

  describe 'size' do
    it 'should be set to 0 initially' do
      expect(object.width).to eq(0)
      expect(object.height).to eq(0)
    end

    it 'should be changeable' do
      object.width = 10; object.height = 20
      expect(object.width).to eq(10)
      expect(object.height).to eq(20)
    end
  end

  describe '#set_position' do
    let(:x) { 10 }; let(:y) { 15 }; let(:angle) { 4 }

    it 'should set x, y, angle directly' do
      object.set_position x, y, angle
      expect(object.x).to eq(x)
      expect(object.y).to eq(y)
      expect(object.angle).to eq(angle)
    end

    it 'should ignore angle if not given' do
      object.set_position x, y, angle
      object.set_position x, y
      expect(object.angle).to eq(angle)
    end
  end

  describe '#turn' do
    let(:angle) { 5 }

    it 'should change angle by given degree' do
      object.turn(angle)
      expect(object.angle).to eq(angle)
    end
  end

  describe '#moved?' do
    it 'should false initially' do
      expect(object.moved?).to be_falsey
    end

    it 'should return true once new positioned is set' do
      object.set_position(1, 1)
      expect(object.moved?).to be_truthy
    end

    it 'should return true if new angle is set' do
      object.set_position(1, 1, 0)
      object.set_position(1, 1, 1)
      expect(object.moved?).to be_truthy
    end

    it 'should return false if same position is set repeatedly' do
      object.set_position(1, 1)
      object.set_position(1, 1)
      expect(object.moved?).to be_falsey
    end
  end

  describe '#overlap?' do
    let(:e1) { position_double(10, 10) }
    let(:e2) { position_double(4, 4) }
    let(:e_on_diff_plane) { position_double(4, 4, 2) }

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

  def position_double(w, h, z = 1)
    pos = klass.new
    allow(pos).to receive(:width).and_return(w)
    allow(pos).to receive(:height).and_return(h)
    allow(pos).to receive(:z_index).and_return(z)
    pos
  end

end
