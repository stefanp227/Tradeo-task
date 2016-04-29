class DropNotesTags < ActiveRecord::Migration[5.0]
  def change
  	drop_table :notes_tags
  end
end
