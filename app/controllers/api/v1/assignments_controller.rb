class Api::V1::AssignmentsController < Api::V1::BaseController
  # acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_assignment, only: [:show]

# 1. Find out who user is based on request header (open id)
# 2. find user …..User.find_by(open_id: request_open_id)
# 3. lessons = Lesson.where(user_id: user)
# 4. map out the attributes of assignments, this will give an array of hashes. Each assignment is a hash, you can add attributes to each assignment.
# 5. assignments_with_lesson_ids = assignments.map {|assignment| assignment.lesson_id = lessons.find(assignment_id: assignment.id) || nil }
# 6. This will return a list of assignments with lesson ids for that user

  def index
    @assignments = policy_scope(Assignment)
    authentication_token = params['user']
    user = User.find_by(authentication_token: authentication_token)
    # call Lesson has student / teacher id
    if user == user.student_id
      users_lessons = user.lessons || []
      assignments = @assignments.map {|assignment| assignment.attributes}

      assignments_with_lesson_ids = assignments.map do |assignment|
        assignment['lesson_id'] = users_lessons.find_by(assignment_id: assignment['id']).id || nil
        assignment
      end
      render json: assignments_with_lesson_ids
    else user == user.teacher_id

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
