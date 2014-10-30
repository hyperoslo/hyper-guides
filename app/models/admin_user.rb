class AdminUser < ActiveRecord::Base

  validates :email, presence: true, uniqueness: true

  def name
    [ first_name, last_name ].compact.join " "
  end

end
