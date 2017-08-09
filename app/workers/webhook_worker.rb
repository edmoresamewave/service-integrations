class WebhookWorker
  include Sidekiq::Worker

  def perform(team_identifier, integration_name, stream_identifier, data)
    # Do something
    Webhook::Received.save(
        team: team_identifier,
        integration: integration_name,
        stream: stream_identifier,
        data: data)
  end
end
