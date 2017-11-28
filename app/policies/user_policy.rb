class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    set_user
  end

  def update?
    set_user
  end

  private

  def set_submission
    record.user == user
  end
end
