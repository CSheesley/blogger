Rails.application.routes.draw do

  root to: 'articles#index'

  resources :articles, only: [:index, :show, :new, :create, :destroy, :edit, :update]
end
