class CreateContactTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_types do |t|
      t.integer :portfolio_id
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
