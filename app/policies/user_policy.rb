class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    set_user
  end

  def create?
    set_user
  end

  def update?
    set_user
  end

  private

  def set_user
    record.user == user
  end
end
