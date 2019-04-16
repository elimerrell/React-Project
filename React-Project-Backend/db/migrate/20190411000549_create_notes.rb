class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.integer :notebook_id
      t.string :title
      t.text :content
      t.string :color

      t.timestamps
    end
  end
end
