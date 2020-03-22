# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  get '/health', to: 'health#health'

  resources :users do
    resources :preferences
  end

end
