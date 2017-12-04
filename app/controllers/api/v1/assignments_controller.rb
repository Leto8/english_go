class Api::V1::AssignmentsController < Api::V1::BaseController
  # acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_assignment, only: [:show]

  def index
    @assignments = policy_scope(Assignment)
    # student - see which are submitted and which arent
    if User.is_student?
      Assignment.submitted      # need to know which are already completed
      Assignment.graded         # show those that are graded
      User.student_assignments  # shows all
    end
    # teacher - see an individual student's submission - pass in student_id??
    if User.is_teacher?
      User.teacher_assignments
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
