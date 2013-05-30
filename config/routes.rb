BpsFishingTour::Application.routes.draw do
    # match '/' => redirect('/login'), via: :get

    get '/thanks' => 'static_pages#thanks'
    get '/confirm' => 'static_pages#confirm'

    get '/events' => 'static_pages#events'


    devise_for :users, controllers: {
        registrations: 'registrations',
        confirmations: 'confirmations'
    }

    authenticated :user do
        # root :to => "main#dashboard", as: :user_root
    end

    resources :profiles
    root to: 'static_pages#home'
    resources :teams
    match '/teams' => 'teams#index', via: :get
    match '/teammate/search' => 'teams/requests#search', as: 'invite_teammate', via: :post
    match '/teammate/send_invite' => 'teams/requests#send_invite', as: 'send_invite', via: :post
    match '/teammate/invite_response/:id' => 'teams/requests#respond_to_invite', as: 'invite_response', via: :get
    match '/teammate/accept_invite/:request_id' => 'teams/requests#accept_invitation', as: 'accept_invite', via: :get
    match '/teammate/reject_invite' => 'teams/requests#reject_invitation', as: 'reject_invite', via: :get

    match '/users/:id/team_invitations' => 'teams/requests#team_invitations', as: 'team_invitations', via: :get
    scope '/teams' do
        match '/requests/new' => 'teams/requests#new', via: :get
    end
end
