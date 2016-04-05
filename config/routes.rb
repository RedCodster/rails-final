Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth/user'

  mount_devise_token_auth_for 'Admin', at: 'auth/admin'
  as :admin do
    # Define routes for Admin within this block.
  end
  root 'static_pages#index'

  resources :quizzes do
    resources :results, only: [:create]
  end

  resources :users, only: [] do
    resources :results, only: [:index]
  end

  resources :users, only: [] do
    resources :quizzes, only: [:create]
  end
end
