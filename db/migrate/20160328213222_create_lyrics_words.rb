class CreateLyricsWords < ActiveRecord::Migration
  def change
    create_table :lyrics_words do |t|
      t.string :value
      t.integer :syllables
      t.integer :section_id
      t.timestamps
    end
  end
end
