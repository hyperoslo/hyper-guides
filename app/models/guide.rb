class Guide < ActiveRecord::Base
  extend FriendlyId

  friendly_id :title, use: :slugged

  publishable on: :published_at

  validates :title, :body, presence: true
end
