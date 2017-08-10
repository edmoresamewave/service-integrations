class Webhook < ApplicationRecord
  after_create :process_webhook

  # def is_github?
  #   integration_id == 'github'
  # end
  #
  # def is_pivotal?
  #   integration_id == 'pivotal-tracker'
  # end

  private

  def process_webhook
    WebhookService::Processor.new(self)
  end
end
