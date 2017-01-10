Rails.application.routes.draw do
  resources :banks, only: :show, param: :routing_number
end
