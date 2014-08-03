class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :user
      can :read, [Post, Hub] 
      can :show, User
    elsif user
      can :read, [Post, Hub]
      can :show, User 
    end
  end

end
