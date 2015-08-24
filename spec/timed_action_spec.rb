require 'spec_helper.rb'

describe TimedAction do
  let(:game) { Game.new }
  let(:object) { Bullet.new(game) }
  let(:delegate) { instance_double(BaseAction) }
  subject(:action) { TimedAction.new(game, object, delegate) }

  describe '#execute' do
    let(:t1) { Time.now }

    before(:each) { action.expires_on t1 }

    context 'before expiration' do
      before(:each) { allow(Time).to receive(:now).and_return(t1 - 1) }

      it 'should not call wrapped action' do
        expect(delegate).not_to receive(:execute)
        action.execute
      end
    end

    context 'after expiration' do
      before(:each) { allow(Time).to receive(:now).and_return(t1 + 1) }

      it 'should call wrapped action' do
        expect(delegate).to receive(:execute)
        action.execute
      end
    end
  end
end
