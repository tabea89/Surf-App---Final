Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}, controllers: { registrations: "user_registrations" }
  resources :users

  resources :products do
    resources :comments
  end
  
  resources :orders, only: [:index, :show, :create, :destroy]

  get '/about', to: 'simple_pages#about'

  get '/contact', to: 'simple_pages#contact'

  post 'simple_pages/thank_you'

  get '/home', to: 'simple_pages#landing_page'
  root 'simple_pages#landing_page'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
