class RemoveNoteIdFromNotebook < ActiveRecord::Migration
  def change
    remove_column :notebooks, :note_id, :integer
  end
end
