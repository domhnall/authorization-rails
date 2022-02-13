Rails.application.routes.draw do
  resources :posts, only: [:index, :show, :destroy]


  [:pundit, :can_can_can, :rolify].each do |lib|
    namespace lib do
      resources :posts, only: [:index, :show, :destroy]
    end
  end

  resource :session, only: [:update]
end
