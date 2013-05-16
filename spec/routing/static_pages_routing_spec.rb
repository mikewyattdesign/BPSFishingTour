require 'spec_helper'

describe 'StaticPages routes' do
    it 'has nice routes' do
        expect(get: '/thanks').to route_to(controller: 'static_pages', action: 'thanks')
    end
end