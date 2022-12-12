class AssignsController < ApplicationController
  before_action :authenticate_user!

  def index
    @assigns = current_user.assign_teams.all
  end

  def create
    team = find_team(params[:team_id])
    user = email_reliable?(assign_params) ? User.find_or_create_by_email(assign_params) : nil
    if user
      team.invite_member(user)
      redirect_to teams_path, notice: "アサインしました"
    else
      redirect_to teams_path, notice: "アサインに失敗しました"
    end
  end

  def destroy
    assign = Assign.find(params[:id])
    redirect_to teams_path(params[:team_id]), notice: "#{assign.team.name}から外れました"
  end

  private
  def assign_params
    params[:email]
  end

  def email_exist?
    team = find_team(params[:team_id])
    if team.members.exists?(email: params[:email])
      redirect_to team_url(team), notice: I18n.t('views.messages.email_already_exists')
    end
  end

  def email_reliable?(address)
    address.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end

  def user_exist?
    team = find_team(params[:team_id])
    unless User.exists?(email: params[:email])
      redirect_to team_url(team), notice: I18n.t('views.messages.does_not_exist_email')
    end
  end

  def find_team(team_id)
    Team.find(params[:team_id])
  end
end
