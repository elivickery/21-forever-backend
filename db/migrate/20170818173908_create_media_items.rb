class CreateMediaItems < ActiveRecord::Migration[5.1]
  def change
    create_table :media_items do |t|

      t.timestamps
    end
  end
end
