class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new


    if user.role?('super_admin')
      can :manage, :all
    elsif user.admin?
      can :manage, User
     else
      can [:create, :new, :edit,:show, :update], User
    end
  end

end

