class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def favorite?
    user.admin?
  end

  def favorites?
    user.admin?
  end

  def myprojects?
    true
  end

  def completedprojects?
    true
  end

end
