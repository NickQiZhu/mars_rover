require_relative '../spec_helper.rb'

describe Explosive do
  let(:klass) { Class.new { include Explosive } }
  subject(:object) { klass.new }

  describe '#explode!' do
     it 'should change image to explosion.png' do
       object.explode!
       expect(object.image).to eq(Explosive::IMAGE)
     end

     it 'should not be exploded initially' do
       expect(object.exploded?).to be_falsey
     end

     it 'should change exploded flag to true' do
       object.explode!
       expect(object.exploded?).to be_truthy
     end
   end

end
