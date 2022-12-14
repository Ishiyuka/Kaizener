class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user = current_user
    @team = Team.find(@user.assign_teams.ids)
    # @teams = Team.where(@user.assign_teams)
    @issue = Issue.find(@user.issues.ids)
  end

  def image
    @usr = User.where(user_id: current_user.id).where.not(image: nil)
  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :department, :icon, :icon_cache)
  end
end
