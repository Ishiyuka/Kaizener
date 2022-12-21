class AssignsController < ApplicationController
  before_action :email_exist?, only: [:create]
  before_action :user_exist?, only: [:create]

  def index
    @assigns = current_user.assign_teams.all
  end

  def create
    team = find_team(params[:team_id])
    user = email_reliable?(assign_params) ? User.find_or_create_by_email(assign_params) : nil
    if user
      team.invite_member(user)
      redirect_to team_path(team), notice: 'アサインしました'
    else
      redirect_to teams_path, notice: 'アサインに失敗しました'
    end
  end

  def destroy
    assign = Assign.find(params[:id])
    assign.destroy # この記載漏れで、削除が出来ていなかった。
    redirect_to teams_path(params[:team_id]), notice: "#{assign.team.name}から外れました"
  end

  private

  def assign_params
    params[:email]
  end

  def email_exist?
    team = find_team(params[:team_id])
    redirect_to team_url(team), notice: 'すでに同じメールアドレスが登録されています' if team.members.exists?(email: params[:email])
  end

  def email_reliable?(address)
    address.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end

  def user_exist?
    team = find_team(params[:team_id])
    unless User.exists?(email: params[:email])
      redirect_to team_url(team), notice: 'メールアドレスが存在しません。アカウントを作成してください。'
    end
  end

  def find_team(team_id)
    Team.find(params[:team_id])
  end
end
