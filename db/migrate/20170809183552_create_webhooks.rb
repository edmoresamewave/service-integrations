class CreateWebhooks < ActiveRecord::Migration[5.1]
  def change
    create_table :webhooks do |t|
      t.string 'team_identifier'
      t.string 'integration_name'
      t.string 'stream_identifier'
      t.jsonb 'payload'
      t.timestamps
    end
  end
end
