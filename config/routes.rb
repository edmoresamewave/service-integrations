Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/:team_identifier/:integration_name/:stream_identifier' => 'webhooks#receive', as: :receive_webhooks
end
