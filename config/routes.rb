Rails.application.routes.draw do

  root to: "links#index"
  resources :links, only: [:index]

  namespace :api do
    namespace :v1 do
      get '/top_link', to: "links#top_links"
      get '/top_ten', to: "links#top_ten"
    end
  end

end
