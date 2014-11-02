class AddShortDescriptionToGuides < ActiveRecord::Migration
  def change
    add_column :guides, :short_description, :text
  end
end
