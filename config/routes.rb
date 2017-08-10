Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/:team_id/:integration_id/:stream_id' => 'webhooks#receive', as: :receive_webhooks

  resources :webhook_configs
end
