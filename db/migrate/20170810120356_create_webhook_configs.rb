class CreateWebhookConfigs < ActiveRecord::Migration[5.1]
  def change
    create_table :webhook_configs do |t|
      t.string :team_id
      t.string :integration_id
      t.string :stream_id
      t.string :url
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
