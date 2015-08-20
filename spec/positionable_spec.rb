require 'spec_helper.rb'

describe Positionable do
  let(:klass) { Class.new { include Positionable } }
  subject(:object) { klass.new }

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

end
