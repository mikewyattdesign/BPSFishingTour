require 'spec_helper'

describe TeamsController do
    it 'has nice routes' do
        expect(get: '/teams').to route_to('teams#index')
    end
end
