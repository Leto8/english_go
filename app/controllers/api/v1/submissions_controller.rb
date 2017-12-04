class Api::V1::SubmissionsController < Api::V1::BaseController
  # acts_as_token_authentication_handler_for User
  before_action :set_submission, only: [:show， :update]

  def index
    @submissions = policy_scope(Submission)
  end


  def show
  end

  def create
    @submission = Submission.new(submission_params)
    @submission.user = User.find_by(:open_id)
    authorize @submission
    if @submission.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def set_submission
    @submission = Submission.find(params[:id])
    authorize @submission
  end

  def submission_params
    params.require(:submission).permit(:content, :voice)
  end
end
