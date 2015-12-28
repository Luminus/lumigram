Rails.application.routes.draw do
  get 'comments/index'

  get 'comments/new'

  get 'comments/show'

  get 'comments/edit'

  get 'posts/index'

  get 'posts/new'

  get 'posts/show'

  get 'posts/edit'

  devise_for :users
  root 'posts#index'
end
