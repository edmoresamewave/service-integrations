class WebhookConfig < ApplicationRecord
  validates :stream_id, uniqueness: true

  scope :active, ->(stream_id) { where(stream_id: stream_id, active: true) }
end
