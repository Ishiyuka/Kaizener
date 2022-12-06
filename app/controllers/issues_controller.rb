class IssuesController < ApplicationController
  before_action :set_issue, only: %i[show edit update destroy]
  before_action :authenticate_user!
  before_action :set_q, only: %i[index search]
  before_action :set_teams, only: %i[new create edit update]

  # GET /issues or /issues.json
  def index
    @issues = @issue_q.result.order(:due_date_at)
  end

  def search
    @results = @issue_q.result
  end

  # GET /issues/1 or /issues/1.json
  def show
  end

  # GET /issues/new
  def new
    @issue = Issue.new
  end

  # GET /issues/1/edit
  def edit
  end

  # POST /issues or /issues.json
  def create
    @issue = current_user.issues.build(issue_params)
    @issue.team_id = params[:issue][:team_id]
    if @issue.save
      redirect_to issues_path(params[:issue][:team_id]), notice: "課題追加しました！"
    else
      render :new
    end
  end

  # PATCH/PUT /issues/1 or /issues/1.json
  def update
    @issue.user_id = current_user.id
    if @issue.update(issue_params)
      redirect_to issues_path(params[:issue][:team_id]), notice:"更新しました"
    else
      render :edit
    end
  end

  # DELETE /issues/1 or /issues/1.json
  def destroy
    @issue.destroy

    respond_to do |format|
      format.html { redirect_to issues_url, notice: "Issue was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def issue_params
      params.require(:issue).permit(:title, :detail, :image, :image_cache, :cause, :goal, :gap, :due_date_at, :priority, :status, :done_flag)
    end

    def set_q
      @issue_q = Issue.ransack(params[:q])
    end

    def set_teams
      @teams = Team.all
    end

end
