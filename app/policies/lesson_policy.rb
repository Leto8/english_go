class LessonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def create?
    true
  end

  def update?
    true
    # record.student == user || record.teacher == user
  end
end

