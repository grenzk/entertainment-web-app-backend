Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :media, only: :index
      resources :bookmarks, only: :index
    end
  end
end
