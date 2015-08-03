Rails.application.routes.draw do
  resources :banks, only: [:show]
end
