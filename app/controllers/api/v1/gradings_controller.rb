class Api::V1::GradingsController < Api::V1::BaseController
  # sacts_as_token_authentication_handler_for User
  before_action :set_grading, only: [:show]

  def index
    @grading = policy_scope(Grading)
  end


  def show
  end

  def create
    @grading = Grading.new(grading_params)
    authorize @grading
    if @grading.save
      @lesson = Lesson.find_by(id: params['lesson_id'])
      @lesson.update(grading_id: @grading.id)
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def set_grading
    @grading = Grading.find(params[:id])
    authorize @grading
  end

  def grading_params
    params.require(:grading).permit(:content, :voice)
  end
end

