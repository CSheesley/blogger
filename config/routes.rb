Rails.application.routes.draw do
  resources :articles, only: [:index, :show, :new, :create, :destroy, :edit]
end
