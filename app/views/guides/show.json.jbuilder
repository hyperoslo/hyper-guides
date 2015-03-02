json.extract! @guide, :id, :title, :short_description, :body, :published_at
json.is_published @guide.published?
json.show_path guide_path(@guide)
json.edit_path edit_guide_path(@guide)
