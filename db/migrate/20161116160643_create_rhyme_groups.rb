class CreateRhymeGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :rhyme_groups do |t|
      t.integer :syllables
      t.timestamps
    end
  end
end
