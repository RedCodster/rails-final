Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  mount_devise_token_auth_for 'Admin', at: 'auth'
  as :admin do
    # Define routes for Admin within this block.
  end
  root 'static_pages#index'

  resources :quizzes
end
