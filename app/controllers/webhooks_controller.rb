class WebhooksController < ApplicationController
  protect_from_forgery with: :null_session, if: -> {request.format.json?}

  def receive
    data = if request.headers['Content-Type'] == 'application/json'
             JSON.parse(request.body.read)
           else
             # application/x-www-form-urlencoded
             params.as_json
           end

    # TODO: Check if integration token (stream_identifier) is in config table, if not return error message.
    WebhookWorker.perform_async(params[:team_id],
                                params[:integration_id],
                                params[:stream_id],
                                data)

    head :ok
  end
end
