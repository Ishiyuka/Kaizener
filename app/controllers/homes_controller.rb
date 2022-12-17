class HomesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @team = current_user.assign_teams
    @issue = current_user.issues
  end
end
