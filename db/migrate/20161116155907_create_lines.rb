class CreateLines < ActiveRecord::Migration[5.0]
  def change
    create_table :lines do |t|
      t.integer :rhyme_group_id
      t.string :text
      t.timestamps
    end
  end
end
