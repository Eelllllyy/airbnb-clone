# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api, format: :json do
    namespace :client do
      resource :session, only: %i[show destroy]
    end
    resources :stays, only: %i[index show]
    resources :experiences, only: :index
    resource :session, only: %i[create update]
  end

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'
  get '*path', to: 'home#index', constraints: ->(req) { req.path.exclude?('rails/active_storage') }
end
