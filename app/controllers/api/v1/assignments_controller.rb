class Api::V1::AssignmentsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User

  def index
    @assignments = policy_scope(Assignment)
  end



  def show
    @user = User.find_by(open_id: params['open_id'])
    @assignment = Assignment.find(params[:id])
    authorize @assignment
  end
end
