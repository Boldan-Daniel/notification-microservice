class CreateNotifications < ActiveRecord::Migration[5.0]
  def up
    create_table :notifications do |t|
      t.string :phone
      t.text :body
      t.string :source_app

      t.timestamps
    end
  end

  def down
    drop_table :notifications
  end
end
