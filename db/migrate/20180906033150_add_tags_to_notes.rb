class AddTagsToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :tags, :string
  end
end
