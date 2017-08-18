class CreateDays < ActiveRecord::Migration[5.1]
  def change
    create_table :days do |t|
      t.string :status
      t.references :goal, null: false

      t.timestamps
    end
  end
end
