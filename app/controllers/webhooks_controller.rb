class WebhooksController < ApplicationController
  protect_from_forgery with: :null_session, if: -> {request.format.json?}

  def receive
    data = if request.headers['Content-Type'] == 'application/json'
             JSON.parse(request.body.read)
           else
             # application/x-www-form-urlencoded
             params.as_json
           end

    if WebhookConfig.active(params[:stream_id]).present?
      WebhookWorker.perform_async(params[:team_id],
                                  params[:integration_id],
                                  params[:stream_id],
                                  data)
      head :ok
    else
      render plain: 'webhook configuration not found', status: 404
    end

  end
end
