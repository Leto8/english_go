class Api::V1::AssignmentsController < Api::V1::BaseController
  # acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_assignment, only: [:show]

  def index
    @assignments = policy_scope(Assignment)
  end


  def show
  end

  private

  def set_assignment
    @assignment = Assignment.find(params[:id])
    authorize @assignment
  end
end
