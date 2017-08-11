class AddPostAsToWebhookConfigs < ActiveRecord::Migration[5.1]
  def change
    add_column :webhook_configs, :post_as, :string
  end
end
