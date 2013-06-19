require 'spec_helper'

describe 'Leaderboard Routes' do
    it 'has nice routes' do
        expect(get: '/leaderboard').to route_to(controller: 'leaderboard', action: 'index')
    end
end