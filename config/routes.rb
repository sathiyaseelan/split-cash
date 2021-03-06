Rails.application.routes.draw do

  resources :members
  resources :groups do
    resources :expenses
  end
  devise_for :users, :controllers => { :registrations => 'user/registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'search_users', to: "users#search"
  get 'lookup_users', to: "users#lookup"
  get 'add_member', to: 'groups#add_member'
end
