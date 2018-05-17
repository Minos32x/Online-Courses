class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    elsif user.instructor?
      can %i[create destroy update read], [Course, Lecture]
    else
      can :read, :all
    end
  end
end
