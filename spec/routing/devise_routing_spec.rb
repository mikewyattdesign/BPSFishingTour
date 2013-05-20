require 'spec_helper'

describe 'Devise Routes' do
    describe 'sessions' do
        it 'has nice routes' do
            expect(get: '/users/sign_in').to route_to(controller: 'devise/sessions', action: 'new')
            expect(post: '/users/sign_in').to route_to(controller: 'devise/sessions', action: 'create')
            expect(delete: '/users/sign_out').to route_to(controller: 'devise/sessions', action: 'destroy')
        end
    end

    describe 'registrations' do
        it 'has nice routes' do
            expect(get: '/users/sign_up').to route_to(controller: 'registrations', action: 'new')
            expect(post: '/users').to route_to(controller: 'registrations', action: 'create')
            expect(get: '/users/edit').to route_to(controller: 'registrations', action: 'edit')
            expect(patch: '/users').to route_to(controller: 'registrations', action: 'update')
            expect(put: '/users').to route_to(controller: 'registrations', action: 'update')
            expect(delete: '/users').to route_to(controller: 'registrations', action: 'destroy')
        end
    end
end