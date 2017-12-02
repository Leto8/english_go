class Api::V1::AssignmentsController < Api::V1::BaseController
  # acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_assignment, only: [:show]

  def index
    @assignments = policy_scope(Assignment)
    # lessons = all of the lessons for the user that requested the list of assignments
    # user.each
    assignments = @assignments.map {|assignment| assignment.attributes}
  end

# 1. Find out who user is based on request header (open id)
# 2. find user …..User.find_by(open_id: request_open_id)
# 3. lessons = Lesson.where(user_id: user)
# 4. map out the attributes of assignments, this will give an array of hashes. Each assignment is a hash, you can add attributes to each assignment.
# 5. assignments_with_lesson_ids = assignments.map {|assignment| assignment.lesson_id = lessons.find(assignment_id: assignment.id) || nil }
# 6. This will return a list of assignments with lesson ids for that user


  def show
  end

  private

  def set_assignment
    @assignment = Assignment.find(params[:id])
    authorize @assignment
  end
end
