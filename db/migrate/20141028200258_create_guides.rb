class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.string :title, null: false
      t.text   :body,  null: false

      t.datetime :published_at

      t.timestamps null: false
    end
  end
end
