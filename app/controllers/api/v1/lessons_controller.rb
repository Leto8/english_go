class Api::V1::LessonsController < Api::V1::BaseController
  # acts_as_token_authentication_handler_for User
  before_action :set_lesson, only: [:show, :update]

  def index
    @lessons = policy_scope(Lesson)
    @user = User.find_by(open_id: params['open_id'])
    # if we user isn't fetched from backend this will fail
    @student = User.find(params[:student_id])
    # Lesson.submitted
    # Lesson.graded
    @user.student_lessons
    render json: @user.student_lessons
  end


  def show
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.student_id = current_user.id
    @lesson.teacher = User.first if @lesson.teacher.blank?
    authorize @lesson
    if @lesson.save
      render :show, status: :created
    else
      render_error
    end
  end

  def update
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
    authorize @lesson
  end

  def lesson_params
    params.require(:lesson).permit(:assignment_id, :student_id, :teacher_id, :submission_id, :grading_id)
  end
end
