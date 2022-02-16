Rails.application.routes.draw do
  resource :session, only: [:update]

  resources :posts, only: [:index, :show, :destroy]

  namespace :pundit do
    resources :posts, only: [:index, :show, :destroy]
  end

  namespace :can_can_can do
    resources :posts, only: [:index, :show, :destroy]
  end
end
