class CreateSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :skills do |t|
      t.integer :portfolio_id
      t.string :name
      t.float :proficiency

      t.timestamps
    end
  end
end
