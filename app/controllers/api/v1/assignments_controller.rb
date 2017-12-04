class Api::V1::AssignmentsController < Api::V1::BaseController
  # acts_as_token_authentication_handler_for User
  before_action :set_assignment, only: [:show]
  before_action :find_user, only: [:index]

  def index
    @assignments = policy_scope(Assignment)

    binding.pry
    if User.is_student? == true
      current_user.submitted      # need to know which are already completed
      Lesson.graded         # show those that are graded
      User.student_assignments  # shows all
    end
    # teacher - see an individual student's submission - pass in student_id??
    if User.is_teacher? == true
      User.teacher_assignments
    end
  end



  def show
  end

  private

  def find_user
    open_id = params[:open_id]
  end

  def set_assignment
    @assignment = Assignment.find(params[:id])
    authorize @assignment
  end
end
