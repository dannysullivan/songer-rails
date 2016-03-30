class AddBeatsInMeasureToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :beats_in_measure, :integer
  end
end
