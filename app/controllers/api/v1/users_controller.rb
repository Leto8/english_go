class Api::V1::UsersController < Api::V1::BaseController

  ################ Do we need these since we aren't using index or show?
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_user, only: [ :show, :update ]
  ########################## ========================================
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
    @user = user.new(user_params)
    @user.user = current_user # is this @user.user or just @user? was previosly @restaurant.user
    authorize @user
    if @user.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @user.destroy
    head :no_content
    # No need to create a `destroy.json.jbuilder` view
  end

  private

  def user_params
    params.require(:user).permit(:username, :phone_number, :email)
  end

  def render_error
    render json: { errors: @user.errors.full_messages },
      status: :unprocessable_entity
  end
end
