class AlterWebhookTable < ActiveRecord::Migration[5.1]
  def change
    change_table :webhooks do |t|
      t.rename :team_identifier, :team_id
      t.rename :integration_name, :integration_id
      t.rename :stream_identifier, :stream_id
    end

    add_column :webhooks, :processed, :boolean, default: false
  end
end
