class CreateMediaItems < ActiveRecord::Migration[5.1]
  def change
    create_table :media_items do |t|
      t.text        :url,     null: false
      t.references :category, null: false

      t.timestamps
    end
  end
end
