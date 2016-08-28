class CreateCCombats < ActiveRecord::Migration[5.0]
  def change
    create_table :c_combats do |t|
      t.string :result, null: false

      t.timestamps
    end
  end
end
