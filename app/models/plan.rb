class Plan < ApplicationRecord
  belongs_to :user
  belongs_to :issue
  belongs_to :team
  enum status:{未完了: 0, 進行中: 1, 完了: 2 }
  enum feedback:{要改善: 0, 様子見: 1, 改善できた！: 2 }

  def self.remind
    now = Date.current
    # @target = now.since(2.days)
    # binding.pry
    # current_user.plans
    Plan.all.each do |plan|
      if plan.status == ( "未完了" || "進行中") && (plan.due_date_at - now).to_i < 2
        RemindMailer.remind_action(plan).deliver
      end
    end
    puts "成功"
  end
end