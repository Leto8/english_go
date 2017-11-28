class GradingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    set_grading
  end

  def update?
    set_grading
  end

  private

  def set_grading
    record.user == user
  end
end
