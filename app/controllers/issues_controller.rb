class IssuesController < ApplicationController
  before_action :set_issue, only: %i[show edit update destroy]
  before_action :set_teams, only: %i[create edit update]

  # GET /issues or /issues.json
  def index
    @team = Team.find(params[:team_id])
    @issue_q = Issue.where(team_id: @team.id).ransack(params[:q])
    @issues = @issue_q.result.order(:done_flag).order(:due_date_at)
    @plans = Plan.all
  end

  def search
    @issue_q = Issue.ransack(params[:q])
    @results = @issue_q.result
  end

  # GET /issues/1 or /issues/1.json
  def show
    @team = Team.find(@issue.team.id)
    @plans = @issue.plans
  end

  # GET /issues/new
  def new
    @team = Team.find(params[:team_id])
    @issue = Issue.new
    @plan = @issue.plans.build
  end

  # GET /issues/1/edit
  def edit
    # @issue.plans.build #この記載があると、空のブランクが出来てしまう。
  end

  # POST /issues or /issues.json
  def create
    @issue = Issue.new(issue_params)
    @issue = current_user.issues.build(issue_params)
    @issue.team = Team.find(params[:team_id])
    @issue.team_id = params[:issue][:team_id]
    if current_user.save && @issue.save
      redirect_to team_issue_path(@team, @issue), notice: '課題追加しました！'
    else
      flash[:alert] = '追加出来ませんでした。'
      render :new
    end
  end

  # PATCH/PUT /issues/1 or /issues/1.json
  def update
    # @issue = current_user.issues.build(issue_params)
    @issue.user_id = current_user.id
    if @issue.update(issue_params)
      redirect_to team_issue_path(params[:issue][:team_id]), notice: '更新しました'
    else
      flash[:alert] = '更新出来ませんでした。'
      render :edit
    end
  end

  # DELETE /issues/1 or /issues/1.json
  def destroy
    if current_user.id == @issue.user_id
      @issue.destroy
      redirect_to team_issues_path(params[:team_id]), notice: '削除しました'
    else
      redirect_to team_issues_path(params[:team_id]), notice: '権限なしのため削除できません。'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_issue
    @issue = Issue.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def issue_params
    params.require(:issue).permit(:title,
                                  :detail,
                                  :image,
                                  :image_cache,
                                  :cause,
                                  :goal,
                                  :gap,
                                  :due_date_at,
                                  :priority,
                                  :status,
                                  :done_flag,
                                  :id,
                                  :user_id,
                                  :team_id,
                                  teams: %i[name owner_id],
                                  plans_attributes: %i[id user_id team_id action pic due_date_at status feedback _destroy])
  end

  def set_teams
    @team = Team.find(params[:team_id])
  end
end
