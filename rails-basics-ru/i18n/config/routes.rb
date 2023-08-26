# frozen_string_literal: true

Rails.application.routes.draw do
  # root ''
  # BEGIN
  # root 'home#index'

  # scope ('/:locale'), locale: /en|ru/ do
  #   resources :posts do
  #     scope module: :posts do
  #       resources :comments, only: %i[new edit create update destroy]
  #     end
  #   end
  # end

  # get "/", to: 'home#index'
  # root 'home#index'

  scope ('/:locale'), locale: /en|ru/ do
    root 'home#index'

    resources :posts do
      scope module: :posts do
        resources :comments
      end
    end
  end
  # scope ('/:locale'), locale: /en|ru/ do
  #   resources :posts do
  #     scope module: :posts do
  #       resources :comments, only: %i[create new]
  #     end
  #   end

  #   resources :posts, shallow: true do
  #     scope module: :posts, shallow_prefix: 'post' do
  #       resources :comments, only: %i[destroy edit update]
  #     end
  #   end
  # end
  # END

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
