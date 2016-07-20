Rails.application.routes.draw do
  resources :members
  resources :groups
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'my_groups', to: "users#mygroups"
  get 'search_users', to: "users#search"
  get 'add_member', to: 'groups#add_member'
end
