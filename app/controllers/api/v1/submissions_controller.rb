class Api::V1::SubmissionsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User
  before_action :set_submission, only: :update

  def index
    @submissions = policy_scope(Submission)
  end


  def show
  end

  def create
    @submission = Submission.new(submission_params)
    authorize @submission
    if @submission.save
      @lesson = Lesson.find_by(id: params['lesson_id'])
      @lesson.update(submission_id: @submission.id)
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
