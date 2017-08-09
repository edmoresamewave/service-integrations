class WebhooksController < ApplicationController
  protect_from_forgery with: :null_session, if: -> {request.format.json?}

  def receive
    if request.headers['Content-Type'] == 'application/json'
      data = JSON.parse(request.body.read)
    else
      # application/x-www-form-urlencoded
      data = params.as_json
    end

    # Webhook::Received.save(
    #     team: params[:team_identifier],
    #     stream: params[:team_identifier],
    #     integration: params[:integration_name],
    #     data: data)

    render json: data
  end
end
