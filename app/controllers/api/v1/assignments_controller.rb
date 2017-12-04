class Api::V1::AssignmentsController < Api::V1::BaseController
  # acts_as_token_authentication_handler_for User
  before_action :set_assignment, only: [:show]

  def index
    @assignments = policy_scope(Assignment)
    @user = User.find_by(open_id: params['open_id'])
    # if we user isn't fetched from backend this will fail

    if @user.is_student? == true
      @user.submitted      # need to know which are already completed
      Lesson.graded         # show those that are graded
      @user.student_assignments  # shows all
    end
    # teacher - see an individual student's submission - pass in student_id??
    if @user.is_teacher? == true
      @user.teacher_assignments
    end
  end



  def show
  end

  private

  def set_assignment
    @assignment = Assignment.find(params[:id])
    authorize @assignment
  end
end
