class WebhookWorker
  include Sidekiq::Worker

  def perform(team_identifier, integration_name, stream_identifier, data)
    # Do something
    Webhook.create(
        team_identifier: team_identifier,
        integration_name: integration_name,
        stream_identifier: stream_identifier,
        payload: data)
  end
end
