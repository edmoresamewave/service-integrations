class WebhookWorker
  include Sidekiq::Worker

  def perform(team_id, integration_id, stream_id, data, headers)
    # Create Webhook
    Webhook.create(team_id: team_id,
                   integration_id: integration_id,
                   stream_id: stream_id,
                   payload: data,
                   headers: headers)
  end
end
