class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :creator_id
      t.string :stream_id
      t.text :body

      t.timestamps
    end
  end
end
