Rails.application.routes.draw do
  root 'app#index'

  get 'o-webove-typografii' => 'app#about'

  post 'app/index' => 'app#index'
  post '/' => 'app#index'
end
