class AdminUser < ActiveRecord::Base

  has_secure_password

  delegate :can?, :cannot?, to: :ability

  validates :email, presence: true, uniqueness: true

  def ability
    @ability ||= Ability.new(self)
  end

  def name
    [ first_name, last_name ].compact.join " "
  end

end
