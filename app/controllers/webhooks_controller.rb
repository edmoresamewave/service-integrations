class WebhooksController < ApplicationController
  protect_from_forgery with: :null_session, if: -> {request.format.json?}

  def receive
    if request.headers['Content-Type'] == 'application/json'
      data = JSON.parse(request.body.read)
    else
      # application/x-www-form-urlencoded
      data = params.as_json
    end

    # WebhookWorker.perform_async(
    #     params[:team_identifier],
    #     params[:integration_name],
    #     params[:stream_identifier],
    #     data)

    render json: data
  end
end
