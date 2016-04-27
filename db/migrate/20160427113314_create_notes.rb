class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
    	t.string :title, null: false
    	t.string :content, null: false

    	t.timestamps null: false
		end
  end
end
