class CreateCClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :c_classes do |t|
      t.string :name, null: false
      t.string :desc

      t.string :first_attribute, null: false
      t.string :second_attribute, null: false

      t.timestamps
    end
  end
end
