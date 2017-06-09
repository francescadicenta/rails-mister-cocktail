Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  get 'doses/new'

  get 'doses/create'

  get 'doses/destroy'

 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :cocktails, only: [:index, :show, :create, :new] do
  resources :doses, only: [:new, :create, :destroy]
end
  resources :doses, only: :destroy
end


