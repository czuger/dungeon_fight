class RemoveResultFromFFight < ActiveRecord::Migration[5.0]
  def change
    remove_column :f_fights, :result, :string
    remove_column :f_fights, :participants, :string
  end
end
