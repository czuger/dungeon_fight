class AddWinnersToFFight < ActiveRecord::Migration[5.0]
  def change
    add_column :f_fights, :winners, :string
  end
end
