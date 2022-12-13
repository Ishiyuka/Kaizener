class RemindMailer < ApplicationMailer
  def remind_action(plan)
    @plan = plan
    mail to: "#{@plan.user.email}", subject: "期限間近アクションタスクのお知らせ"
  end
end
