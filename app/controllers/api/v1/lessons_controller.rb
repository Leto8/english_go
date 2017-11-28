class Api::V1::LessonsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_lesson, only: [:show]

  def index
    @lessons = policy_scope(Lesson)
  end


  def show
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
    authorize @lesson
  end

end
