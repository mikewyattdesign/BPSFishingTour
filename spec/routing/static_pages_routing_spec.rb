require 'spec_helper'

describe 'StaticPages routes' do
    it 'has nice routes' do
        expect(get: '/').to route_to(controller: 'static_pages', action: 'home')
    end
end