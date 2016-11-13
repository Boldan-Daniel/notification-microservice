class CreateClients < ActiveRecord::Migration[5.0]
  def up
    create_table :clients do |t|
      t.string :source_app
      t.string :api_key

      t.timestamps
    end
  end

  def down
    drop_table :clients
  end
end
