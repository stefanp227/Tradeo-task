class RemoveTagIdFromNotes < ActiveRecord::Migration[5.0]
  def change
  	remove_column :notes, :tag_id
  end
end
