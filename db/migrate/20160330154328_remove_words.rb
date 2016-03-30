class RemoveWords < ActiveRecord::Migration
  def change
    drop_table :words
  end
end
