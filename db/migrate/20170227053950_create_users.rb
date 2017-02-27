class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :linkedin
      t.string :github
      t.string :twitterhandle
      t.timestamps
    end
  end
end
