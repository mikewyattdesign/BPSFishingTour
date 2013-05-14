require 'spec_helper'

describe 'Devise Routes' do
    describe 'sessions' do
        it 'has nice routes' do
            expect(get: '/login').to route_to(controller: 'devise/sessions', action: 'new')
            expect(post: '/login').to route_to(controller: 'devise/sessions', action: 'create')
            expect(delete: '/logout').to route_to(controller: 'devise/sessions', action: 'destroy')
        end
    end

    describe 'registrations' do
        it 'has nice routes' do
            expect(get: '/register').to route_to(controller: 'devise/registrations', action: 'new')
            expect(post: '/users').to route_to(controller: 'devise/registrations', action: 'create')
            expect(get: '/users/edit').to route_to(controller: 'devise/registrations', action: 'edit')
            expect(patch: '/users').to route_to(controller: 'devise/registrations', action: 'update')
            expect(put: '/users').to route_to(controller: 'devise/registrations', action: 'update')
            expect(delete: '/users').to route_to(controller: 'devise/registrations', action: 'destroy')
        end
    end
end