Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :categories, except: [:destroy]
  root "homes#landingPage"
  get '/about', to: 'homes#about'
  # root :to => redirect('/articles')
  resources :articles
  get 'signup', to: 'users#new'
  get 'login', to: 'session#new'
  post 'login', to: 'session#create'
  delete 'logout', to: 'session#destroy'
  resources :users, except: [:new]
end
