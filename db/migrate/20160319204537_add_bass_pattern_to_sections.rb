class AddBassPatternToSections < ActiveRecord::Migration
  def change
    add_column :sections, :bass_pattern, :string
  end
end
