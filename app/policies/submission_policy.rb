class SubmissionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    true
  end

  def update?
    set_submission
  end

  private

  def set_submission
    record.user == user.student_id
  end
end
