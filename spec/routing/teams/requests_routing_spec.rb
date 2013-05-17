require 'spec_helper'

describe Teams::RequestsController do
    it 'has nice routes' do
        expect(get: '/teams/requests/new').to route_to('teams/requests#new')
    end
end
