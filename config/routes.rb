Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users
      resources :lessons, shallow: true
      resources :assignments, shallow: true
      resources :submissions, shallow: true
      resources :gradings, shallow: true
      get :file_upload, to: 'submissions#qiniu'
    end
  end
end
