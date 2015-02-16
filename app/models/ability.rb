class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    if user.role?('user')
      can [:create, :new, :edit,:show], User
    elsif user.role? Admin
      if user.role?('admin')
        can :manage, Admin
      elsif user.role? :super_admin
        can :manage, :all
      end
    end
  end



  def role?(role)
    self.role.name == role
  end

end

