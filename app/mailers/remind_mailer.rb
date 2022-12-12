class RemindMailer < ApplicationMailer
  def remind_mail(remind)
    @remind = remind

    mail to: @remind.user.email, subject: "期限間近アクションタスクのお知らせ"
  end
end
