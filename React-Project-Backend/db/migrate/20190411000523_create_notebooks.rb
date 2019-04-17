class CreateNotebooks < ActiveRecord::Migration[5.2]
  def change
    create_table :notebooks do |t|
      t.integer :user_id
      t.string :category
      t.string :title
      t.string :description
      t.timestamps
    end
  end
end
