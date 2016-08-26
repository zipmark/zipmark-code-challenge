Rails.application.routes.draw do
  root to: "static_pages#root"
  resources :banks, only:[:show]
end
