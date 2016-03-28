class AddSectionIdToWords < ActiveRecord::Migration
  def change
    add_column :words, :section_id, :integer
  end
end
