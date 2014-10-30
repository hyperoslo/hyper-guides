class Ability
  include CanCan::Ability

  def initialize(admin_user)
    # Admin abilities
    can :manage, :all if admin_user

    # Regular users
    can :read, Guide.published
  end
end
