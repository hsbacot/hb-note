class AddPublishableToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :publishable, :boolean, default: true
  end
end
