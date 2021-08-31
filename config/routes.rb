# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: redirect('/items')
  resources :items
end
