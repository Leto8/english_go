class Api::V1::UsersController < Api::V1::BaseController
  # acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_user, only: [ :show, :update ]

  require 'net/http'
  require "uri"
  require "json"
  require "faker"

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

  def create
    open_id = swap_code_for_open_id(params[:code])

    @user = User.find_or_create_by(open_id: open_id)
    @user.update(user_params)
    @user.email = Faker::Internet.email
    @user.password = 'fuckthis'
    @user.save

    authorize @user
    if @user.save
      render json: @user.to_json
    else
      render_error
    end
  end

  private

  def swap_code_for_open_id(code)
    url = "https://api.weixin.qq.com/sns/jscode2session?appid=#{ENV['wechat_appid']}&secret=#{ENV['wechat_secret']}&grant_type=authorization_code&js_code=#{code}"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    headers = {'Content-Type' => 'application/json'}
    request = Net::HTTP::Get.new(uri, headers)
    response = http.request(request)
    open_id = JSON.parse(response.body)["openid"]
  end

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  def user_params
    params.require(:user).permit(:username, :avatar)
  end

  def render_error
    render json: { errors: @user.errors.full_messages },
      status: :unprocessable_entity
  end
end
