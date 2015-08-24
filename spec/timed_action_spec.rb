require 'spec_helper.rb'

describe TimedAction do
  let(:game) { Game.new }
  let(:element) { Bullet.new(game) }
  let(:delegate) { instance_double(BaseAction, execute: nil) }
  subject(:action) { TimedAction.new(game, element, delegate) }

  describe '#execute' do
    let(:t1) { Time.now }

    before(:each) { action.expires_on t1 }

    context 'before expiration' do
      before(:each) { allow(Time).to receive(:now).and_return(t1 - 1) }

      it 'should not call wrapped action' do
        expect(delegate).not_to receive(:execute)
        action.execute
      end

      it 'should requeue the action' do
        action.execute
        expect(element.last_action).to eq(action)
      end
    end

    context 'after expiration' do
      before(:each) { allow(Time).to receive(:now).and_return(t1 + 1) }

      it 'should call wrapped action' do
        expect(delegate).to receive(:execute)
        action.execute
      end

      it 'should not requeue the action' do
        action.execute
        expect(element.last_action).to be_nil
      end
    end
  end
end
