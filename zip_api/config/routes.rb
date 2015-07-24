Rails.application.routes.draw do
  get  '/banks/:routing_number' => 'bank#show'
end
