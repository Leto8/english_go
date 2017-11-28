class GradingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    #needs to be a teacher id
    true
  end
end
