class RemoveLyricsFromSection < ActiveRecord::Migration
  def change
    remove_column :sections, :lyrics
  end
end
