class AddSlugToGuides < ActiveRecord::Migration
  def change
    add_column :guides, :slug, :string, null: false, default: ''
  end
end
