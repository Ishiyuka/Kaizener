class AssignsController < ApplicationController
  def index
    @assigns = current_user.assign_teams.all
  end

  def create
    assign = current_user.assigns.create(team_id: params[:team_id])
    redirect_to teams_path, notice: "#{assign.team.name}に加わりました"
  end

  def destroy
    assign = current_user.assigns.find_by(id: params[:id]).destroy
    redirect_to teams_path, notice: "#{assign.team.name}から外れました"
  end

end
