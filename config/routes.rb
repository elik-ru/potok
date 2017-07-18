# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'index#index'
  post '/' => 'index#calculate', as: :calculate

  resources :loans do
    collection do
      post :reset
    end
  end
end
