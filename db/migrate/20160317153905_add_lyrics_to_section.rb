class AddLyricsToSection < ActiveRecord::Migration
  def change
    add_column :sections, :lyrics, :string
    remove_column :songs, :lyrics
    remove_column :songs, :pattern
  end
end
