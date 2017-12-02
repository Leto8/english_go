class Api::V1::UsersController < Api::V1::BaseController
  # acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_user, only: [ :show, :update ]

  require 'net/http'
  require "uri"
  require "json"

   def index
    @user = policy_scope(User)
  end

  def show
  end

  def update
    if @user.update(user_params)
      render :show
    else
      render_error
    end
  end

  def create(code)
    open_id = swap_code_for_open_id(code)
    @user = User.new(user_params)
    @user.user = current_user # is this @user.user or just @user? was previosly @restaurant.user
    authorize @user
    if @user.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def swap_code_for_open_id(code)
    url = "https://api.weixin.qq.com/sns/jscode2session?appid=#{ENV['wechat_appid']}&secret=#{ENV['wechat_secret']}&grant_type=authorization_code&js_code=#{res.code}"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    headers = {'Content-Type' => 'application/json'}
    request = Net::HTTP.Get.new(uri, headers)
    response = http.request(request)
    open_id = response.data.openid
    return open_id
  end

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  def user_params
    params.require(:user).permit(:username, :phone_number, :email, :code)
  end

  def render_error
    render json: { errors: @user.errors.full_messages },
      status: :unprocessable_entity
  end
end
