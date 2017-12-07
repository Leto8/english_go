class Api::V1::SubmissionsController < Api::V1::BaseController
  # acts_as_token_authentication_handler_for User
  before_action :set_submission, only: :update
  require 'qiniu'
  require 'faker'

  def index
    @submissions = policy_scope(Submission)
  end


  def qiniu
    skip_authorization
    # skip_policy_scope
    token = get_token
    render json: {key: @key, token: token}
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

  def get_token
    # skip_authorization!
    # skip_policy_scope!
    @key = Time.now.to_i.to_s + 'recording'
    Qiniu.establish_connection! access_key: 'PJP0bjvUkPBLO3PmSgAfuVyEh9aTAlzYmiItmRCm',
                                secret_key: 'wiuHuXtZNXR5URJDt8TvqjbIq9mQrdczkPfiN3l6'

    bucket = 'englishgo'
    # http://developer.qiniu.com/article/developer/security/put-policy.html
    put_policy = Qiniu::Auth::PutPolicy.new(
        bucket, # 存储空间
        @key,    # 指定上传的资源名，如果传入 nil，就表示不指定资源名，将使用默认的资源名
        72000    # token 过期时间，默认为 3600 秒，即 1 小时
    )
    uptoken = Qiniu::Auth.generate_uptoken(put_policy)
  end

  def set_submission
    @submission = Submission.find(params[:id])
    authorize @submission
  end

  def submission_params
    params.require(:submission).permit(:content, :voice)
  end
end
