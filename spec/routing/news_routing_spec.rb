require 'spec_helper'

describe 'News Routes' do
    it 'has nice routes' do
        expect(get: '/news').to route_to(controller: 'news', action: 'index')
    end
end