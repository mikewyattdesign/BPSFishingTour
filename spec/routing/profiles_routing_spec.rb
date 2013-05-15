require 'spec_helper'

describe ProfilesController do
    it 'has nice routes' do
        expect(get:    '/profiles').to        route_to('profiles#index')
        expect(get:    '/profiles/new').to    route_to('profiles#new')
        expect(get:    '/profiles/1').to      route_to('profiles#show',    id: '1')
        expect(get:    '/profiles/1/edit').to route_to('profiles#edit',    id: '1')
        expect(post:   '/profiles').to        route_to('profiles#create')
        expect(put:    '/profiles/1').to      route_to('profiles#update',  id: '1')
        expect(delete: '/profiles/1').to      route_to('profiles#destroy', id: '1')
    end
end
