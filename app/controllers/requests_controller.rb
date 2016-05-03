class RequestsController < ApplicationController
  def show
    @request = Request.find(params[:id])
  end

  def new
    @request = Request.new
    @user = User.find(params[:requestable_id])

  end

  def approve
    @request = Request.find(params[:id])
    @request.approved = true
    @request.done = false
    @request.save
    redirect_to user_path(@request.requestable_id)
  end

  def done
    @request = Request.find(params[:id])
    @request.done = true
    @request.save
    redirect_to user_path(@request.requestable_id)
  end

  def create
    @request = Request.new request_params
    @request.requestor_id = current_user.id
    @request.requestable_type = "User"
    @request.approved = false
    @request.done = false
    # find the user of the page
    # @user = User.find()
    # @request.user =

    @request.save
    redirect_to user_path(@request.requestable_id)
  end

  def edit
    @request = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])
    @request.update(request_params)
    redirect_to user_path(@request.requestable_id)
  end

  private

  def request_params
    params.require(:request).permit(:description, :due_date, :requestable_id)
  end


end
