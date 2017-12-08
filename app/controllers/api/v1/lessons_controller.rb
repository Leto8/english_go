class Api::V1::LessonsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User
  before_action :set_lesson, only: [:show, :update]

  def index
    @lessons = policy_scope(Lesson)
    @user = User.find_by(id: params['user_id'])
    # fails - nil result

    from_teacher = params[:from_teacher] == "true"

    if from_teacher
      @teacher = @user
      @lessons = @teacher.teaching_lessons
    else

      @student = @user
      @lessons = @student.student_lessons

    end

    render json: @lessons
  end

  def show
    @lesson = Lesson.find(params[:id])
    submission = @lesson.submission.try(:attributes)
    assignment = @lesson.assignment.try(:attributes)
    grading = @lesson.grading.try(:attributes)
    result = @lesson.attributes.merge(submission: submission, grading: grading, assignment: assignment)
    render json: result
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
    submission = @lesson.submission || Submission.new(lesson: @lesson)
    submission.update voice: params[:submission_voice] if params[:submission_voice]


    grading = @lesson.grading || Grading.new(lesson: @lesson)
    grading.update voice: params[:grading_voice] if params[:grading_voice]

    submission = @lesson.submission.try(:attributes)
    grading = @lesson.grading.try(:attributes)
    result = @lesson.attributes.merge(submission: submission, grading: grading)
    render json: result
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
