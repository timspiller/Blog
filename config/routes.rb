Rails.application.routes.draw do
resources :articles
root 'pages#index'
get 'about', to: 'pages#about'

end
