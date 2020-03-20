# frozen_string_literal: true

Rails.application.routes.draw do
  get '/health', to: 'health#health'

  resources :users, only: %i[index show create update destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
