class AssignmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  # def create?
  #   set_assignment
  # end

  # def update?
  #   set_assignment
  # end

  # private

  # def set_assignment
  #   record.user == user
  # end
end
