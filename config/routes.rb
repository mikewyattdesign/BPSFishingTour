BpsFishingTour::Application.routes.draw do
    # match '/' => redirect('/login'), via: :get


    get '/thanks' => 'static_pages#thanks'

    devise_for :users, skip: [:sessions, :registration], controllers: {registrations: 'registrations'}
    as :user do
        # Registrations Routes
        get    '/register'   => 'registrations#new',     as: :new_user_registration
        post   '/users'      => 'registrations#create',  as: :user_registration
        get    '/users/edit' => 'registrations#edit',    as: :edit_user_registration
        patch  '/users'      => 'registrations#update',  as: :patch_user_registration
        put    '/users'      => 'registrations#update',  as: :update_user_registration
        delete '/users'      => 'registrations#destroy', as: :destroy_user_registration
        # Sessions Routes
        get    '/login' =>  'devise/sessions#new',     as: :new_user_session
        post   '/login' =>  'devise/sessions#create',  as: :user_session
        delete '/logout' => 'devise/sessions#destroy', as: :destroy_user_session
    end

    authenticated :user do
        # root :to => "main#dashboard", as: :user_root
    end

    resources :profiles
    root to: 'static_pages#home'

    match '/teams' => 'teams#index', via: :get

    scope '/teams' do
        match '/requests/new' => 'teams/requests#new', via: :get
    end
end
