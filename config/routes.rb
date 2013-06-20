BpsFishingTour::Application.routes.draw do

    # Static Page Routing
    root to: 'static_pages#home'
    get '/thanks'  => 'static_pages#thanks'
    get '/about'   => 'static_pages#about'
    get '/confirm' => 'static_pages#confirm'

    # Profile Routing
    get '/myprofile' => 'profiles#show_current', as: 'my_profile'
    resources :profiles

    # Event Routing
    resources :events
    match '/events/:id/attend' => 'events#register_event', as: 'register_event', via: :post

    # Authentication Routing
    devise_for :users, controllers: {
        registrations: 'registrations',
        confirmations: 'confirmations'
    }

    get '/join', to: redirect('/users/sign_up')

    # Team Routing
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

    resources :teams

    # Anglers Routing
    get '/anglers' => 'anglers#index'

    # Leaderboard Routing
    get '/leaderboard' => 'leaderboard#index'

    # News Routing
    get '/news' => 'news#index'
end
