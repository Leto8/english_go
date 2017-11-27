Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :lessons, shallow: true do
    resources :assignments
    resources :submissions
    resources :gradings
  end
end
