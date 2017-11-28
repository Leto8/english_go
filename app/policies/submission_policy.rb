class SubmissionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    set_submission
  end

  def update?
    set_submission
  end

  private

  def set_submission
    record.user == user
  end
end
