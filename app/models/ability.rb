class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user && user.role === "admin"
      can :manage, :all
    elsif user || user.role === "subscriber"
      can :read, :all
    end
  end
end
