Rails.application.routes.draw do
  get '/:friendly_id', to: 'users#show', as: 'user'

  devise_for :users
  root 'posts#index'

  resources :posts do
    member do
      put "like", to: 'posts#like'
      delete "unlike", to: 'posts#unlike'
    end

    resources :comments
  end
end
