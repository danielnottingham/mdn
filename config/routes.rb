# frozen_string_literal: true

Rails.application.routes.draw do
  mount Lookbook::Engine, at: "lookbook"

  root "accounts#index"
  resources :accounts, only: %i[index new create]
end
