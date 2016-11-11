class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
    	t.string :name
    	t.string :genre
    	t.integer :page_count
    	t.attachment :image

    	t.timestamps
    end
  end
end
