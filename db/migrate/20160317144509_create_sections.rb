class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :pattern
      t.integer :song_id
      t.timestamps
    end
  end
end
