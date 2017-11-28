class Api::V1::LessonsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_lesson, only: [:show]

  def index
    @lessons = policy_scope(Lesson)
  end


  def show
  end

  def create
    @lesson = Lesson.new(lesson_params)
    authorize @lesson
    if @lesson.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
    authorize @lesson
  end

  def lesson_params
    params.require(@lesson).permit(:assignment_id, :submission_id, :grading_id, :student_id, :teacher_id)
  end
end
