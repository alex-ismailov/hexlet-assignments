# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homes#index'

  # root 'posts/posts#index'
  # bin/rails g controller comments_controller index new create show edit update destroy 
  # get 'comments/index'
  # get 'comments/new'
  # get 'comments/create'
  # get 'comments/show'
  # get 'comments/edit'
  # get 'comments/update'
  # get 'comments/destroy'

  # BEGIN
  scope module: :posts do
    resources :post, only: %i[index], as: 'posts'

    resources :post, except: [:index] do
      # resources comments, only: %i[index new create]
    end

    # resources :post, shallow: true do
      # resources comments, only: %i[show edit update destroy]
    # end
  end
  # END


  # scope module: :web do
  #   resources :books, except: [:index] do
  #     resources :pages, only: [:index, :new, :create]
  #   end

  #   resources :books, except: [:index], shallow: true do
  #     resources :pages, only: [:show, :edit, :update, :destroy]
  #   end 
  # end 
end
