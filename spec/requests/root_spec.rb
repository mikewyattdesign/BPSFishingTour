require 'spec_helper'

describe 'Root page' do
    before :each do
        visit '/'
        expect(response).to redirect_to('/login')
    end
end
