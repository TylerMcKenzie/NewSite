class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.integer :user_id
      t.string :name
      t.string :url
      t.boolean :completed
      t.timestamps
    end
  end
end
