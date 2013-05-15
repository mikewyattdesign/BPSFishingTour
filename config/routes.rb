BpsFishingTour::Application.routes.draw do
    root "static_pages#home"
    get '/thanks' => 'static_pages#thanks'

    devise_for :users, skip: [:sessions, :registration]
    as :user do
        # Registrations Routes
        get    '/register'   => 'devise/registrations#new',     as: :new_user_registration
        post   '/users'      => 'devise/registrations#create',  as: :user_registration
        get    '/users/edit' => 'devise/registrations#edit',    as: :edit_user_registration
        patch  '/users'      => 'devise/registrations#update',  as: :patch_user_registration
        put    '/users'      => 'devise/registrations#update',  as: :update_user_registration
        delete '/users'      => 'devise/registrations#destroy', as: :destroy_user_registration

        # Sessions Routes
        get    '/login' =>  'devise/sessions#new',     as: :new_user_session
        post   '/login' =>  'devise/sessions#create',  as: :user_session
        delete '/logout' => 'devise/sessions#destroy', as: :destroy_user_session
    end

    resources :profiles
end
