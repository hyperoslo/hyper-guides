json.array! @guides do |guide|
  json.extract! guide, :title, :short_description, :published_at
  json.is_published guide.published?
  json.show_path guide_path(guide)
end
