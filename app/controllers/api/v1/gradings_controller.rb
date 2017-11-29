class Api::V1::GradingsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [:index, :show]
  before_action :set_grading, only: [:show]

  def index
    @grading = policy_scope(Grading)
  end


  def show
  end

  def create
    # @submission = submission.find(params[:id])
    @grading = Grading.new(grading_params)
    @grading.user = current_user
    authorize @grading
    if @grading.save
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

