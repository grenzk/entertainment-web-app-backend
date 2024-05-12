Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :users,
                 singular: :user,
                 controllers: {
                   sessions: 'api/v1/users/sessions',
                   registrations: 'api/v1/users/registrations'
                 }
      get '/member-data', to: 'members#show'

      resources :media, only: :index
      resources :bookmarks, only: %i[index create destroy]
    end
  end
end
