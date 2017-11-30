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
    if record.user == user.teacher_id
      record.user == user
    end
  end
end
