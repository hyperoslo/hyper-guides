class AdminUser < ActiveRecord::Base

  has_secure_password

  validates :email, presence: true, uniqueness: true

  def name
    [ first_name, last_name ].compact.join " "
  end

end
