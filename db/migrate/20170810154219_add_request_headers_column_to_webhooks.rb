class AddRequestHeadersColumnToWebhooks < ActiveRecord::Migration[5.1]
  def change
    add_column :webhooks, :headers, :jsonb
  end
end
