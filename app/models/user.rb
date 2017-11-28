class User < ApplicationRecord
  acts_as_token_authenticatable

  # has many relationships
  # a teacher has many lessons
  # a student

  has_many :teaching_lessons, class_name: "Lesson", foreign_key: "teacher_id"
  has_many :student_lessons, class_name: "Lesson", foreign_key: "student_id"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # :confirmable, :lockable, :timeoutable and :omniauthable

  def index         # GET
  end

  def show          # GET
  end

  def new           # GET
    @user = User.new
  end

  def create        # POST
    @user = User.new(user_params)
    @user.save
    # phone number
    # certificate (boolean)
    # level - don't add this. We will add this on the backend.
  end

  def edit          # GET
    # Do we need an edit page?
    @user = User.find(params[:id])
  end

  def update        # PATCH
    @user = User.find(params[:id])
    @user.update(user_params)
    # Username
    # phone number
    # email
  end

  def destroy       # DELETE
    @user = User.find(params[:id])
    @user.destroy
  end

  private
  def user_params
    params.require(:user).permit(:email, :phone_number, :username)
  end
end
