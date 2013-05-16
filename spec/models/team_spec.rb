require 'spec_helper'

describe Team do
    let (:team) { Team.new(id: 1) }

    it 'should respond to :users' do
        expect(team).to respond_to(:users)
    end
end
