class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.string      :title,     null: false
      t.boolean     :completed, default: false
      t.boolean     :archived,  default: false 
      t.references  :category,  null: false
      t.references  :user,      null: false
      
      t.timestamps
    end
  end
end
