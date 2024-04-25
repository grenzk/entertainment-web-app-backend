Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :media, only: :index
      resources :bookmarks, only: %i[index create destroy]
    end
  end
end
