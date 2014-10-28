class RemoveDefaultSlugForGuides < ActiveRecord::Migration
  def up
    change_column_default :guides, :slug, nil
  end

  def down
    change_column_default :guides, :slug, ""
  end
end
