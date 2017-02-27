class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :title
      t.string :url
      t.boolean :read
      t.integer :lockbox_id
      t.integer :user_id

      t.timestamps
    end
  end
end
