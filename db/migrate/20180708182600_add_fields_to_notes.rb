class AddFieldsToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :completed, :boolean, default: false
    add_column :notes, :archived, :boolean, default: false
  end
end
