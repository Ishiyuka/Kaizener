class HomesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @teams = Team.all.includes(:user)
    @issues = Team.all.includes(:user, :team)
    @plans = Team.all.includes(:user, :team, :issue)
  end
end
