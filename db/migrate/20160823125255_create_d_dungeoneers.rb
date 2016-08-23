class CreateDDungeoneers < ActiveRecord::Migration[5.0]
  def change
    create_table :d_dungeoneers do |t|
      t.string :name, null: false
      t.string :desc
      t.integer :fo, null: false
      t.integer :coo, null: false
      t.integer :mem, null: false
      t.integer :vol, null: false
      t.references :c_class, foreign_key: true, null: false

      t.timestamps
    end
  end
end
