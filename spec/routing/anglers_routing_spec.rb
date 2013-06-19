require 'spec_helper'

describe 'Anglers Routes' do
    it 'has nice routes' do
        expect(get: '/anglers').to route_to(controller: 'anglers', action: 'index')
    end
end