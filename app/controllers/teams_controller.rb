class TeamsController < ApplicationController
  before_action :set_team, only: %i[show edit update destroy]

  # GET /teams or /teams.json
  def index
    @teams = Team.all
    if params[:my_team]
      @teams = current_user.assign_teams
    else
      @teams = Team.all
    end
  end

  # GET /teams/1 or /teams/1.json
  def show
    @assign = current_user.assigns.find_by(team_id: @team.id)
    @members = @team.members
    @issues = @team.issues
    # @plans = @team.plans
    data = @team.plans.group(:pic).count
    @data = data.transform_keys! { |k| User.find(k).name }
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams or /teams.json
  def create
    @team = Team.new(team_params)
    @team.owner = current_user
    if @team.save
      @team.invite_member(@team.owner)
      redirect_to teams_path(params[:team_id]), notice: 'チームを作成しました'
    else
      flash[:alert] = '作成出来ませんでした'
      render :new
    end
  end

  # PATCH/PUT /teams/1 or /teams/1.json
  def update
    if current_user.id == @team.owner_id
      @team.update(team_params)
      redirect_to teams_path(params[:team_id]), notice: '更新しました'
    else
      flash[:alert] = 'チームリーダーのみ編集が可能です。'
      render :edit
    end
  end

  # DELETE /teams/1 or /teams/1.json
  def destroy
    if current_user.id == @team.owner_id
      @team.destroy
      redirect_to teams_path(params[:team_id]), notice: 'チーム削除しました'
    else
      redirect_to teams_path(params[:team_id]), notice: 'チームリーダーのみ削除できます'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_team
    @team = Team.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def team_params
    params.require(:team).permit(:name, :owner_id)
  end
end
