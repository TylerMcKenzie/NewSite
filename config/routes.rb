Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/' => 'user#index'
  resources :user do
    # resources :project
    # resources :skill
    # resources :contact_type
  end
  # get '/' => 'user#index'
  # post '/new' => 'user#new'
end
