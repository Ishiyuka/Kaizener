class RemindMailer < ApplicationMailer
  def remind_action(team)
    @today = Date.today
    @team = team
    team.plans.each do |plan|
      if plan.status == (0 || 1) && (plan.due_date_at - @today).to_i < 2
        @action_not_yet = true
      end
    end
    if @action_not_yet == true
      team_users << team.users
      mail to: team_users.pluck(:email), subject: "期限間近アクションタスクのお知らせ"
    end
  end
end
