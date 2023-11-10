Blog::Engine.routes.draw do
  root to: 'blogs#index'
  
  resources :blogs
  # namespace :blog do
  #   resources :blogs
  # end
end
