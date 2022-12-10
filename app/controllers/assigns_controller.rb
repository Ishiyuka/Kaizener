class AssignsController < ApplicationController
  before_action :authenticate_user!

  def index
    @assigns = current_user.assign_teams.all
  end

  def create
    team = find_team(params[:team_id])
    assign = current_user.assigns.create(team_id: params[:team_id])
    redirect_to teams_path, notice: "#{assign.team.name}に加わりました"
  end

  def destroy
    assign = current_user.assigns.find_by(id: params[:id]).destroy
    redirect_to teams_path, notice: "#{assign.team.name}から外れました"
  end

  def find_team(team_id)
    Team.find(params[:team_id])
  end
end
