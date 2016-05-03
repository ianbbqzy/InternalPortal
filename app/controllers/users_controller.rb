class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def timeslots
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    render "show"
  end

  def user_params
    params.require(:user).permit(:team, :timeslot_ids => [])
  end

end
