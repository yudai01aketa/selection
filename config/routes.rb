Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :ideas, only: %i[index create]
    end
  end
end
