class AddParticipantsToCombat < ActiveRecord::Migration[5.0]
  def change
    add_column :f_fights, :participants, :string, null: false, default: '[]'
    change_column :f_fights, :result, :string, :null => true
  end
end
