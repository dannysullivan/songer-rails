class AddRhythmsToSong < ActiveRecord::Migration
  def change
    add_column :songs, :rhythm1, :string
    add_column :songs, :rhythm2, :string
  end
end
