class PlansController < ApplicationController
  before_action :set_plan, only: %i[show edit update destroy]
  before_action :authenticate_user!
  before_action :set_teams, only: %i[new create edit update]
  before_action :set_issues, only: %i[new create edit update]
  # before_action :set_users, only: %i[new create edit update]

  # GET /plans or /plans.json
  def index
    @issues = Issue.all
    @plans = Plan.all
  end

  # GET /plans/1 or /plans/1.json
  def show
    @team = Team.find(@plan.team.id)
    @issue = Issue.find(@plan.issue.id)
  end

  # GET /plans/new
  def new
    @issue = Issue.find(params[:issue_id])
    @team = @issue.team
    @plan = @issue.plans.build
  end

  # GET /plans/1/edit
  def edit
    @plan = @issue.plans.build
  end

  # POST /plans or /plans.json
  def create
    @issue = Issue.find(params[:issue_id])
    @plan = issue.plans.build(plan_params)
    @plan.user = current_user
    @plan.team_id = issue.team_id
      if @plan.save
        redirect_to team_issue_plan_path(@team, @issue, plan), notice: "action planを作成しました"
      else
        render new, notice: "保存できませんでした"
      end
  end

  # PATCH/PUT /plans/1 or /plans/1.json
  def update
    if @plan.update(plan_params)
      redirect_to @plan, notice: "action planを更新しました"
    else
      render :edit, notice: "更新できませんでした"
    end
  end

  # DELETE /plans/1 or /plans/1.json
  def destroy
    @plan.destroy
    redirect_to plan_path(plan)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def plan_params
      params.require(:plan).permit(:action, :pic, :due_date_at, :status, :feedback,teams: %i[name owner_id])
    end

    def set_teams
      @team = Team.find(params[:team_id])
    end

    def set_issues
      @issue = Issue.find(params[:issue_id])
    end

    # def set_users
    #   @user = User.find(params[:issue_id])
    # end
end
