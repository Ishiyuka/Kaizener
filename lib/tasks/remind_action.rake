namespace :remind_action do
  desc '毎朝9時に期限が2日前のアクションをリマインド'
  task reminder: :environment do
    now = Date.current
    Plan.all.each do |plan|
      RemindMailer.remind_action(plan).deliver if plan.status == ('未完了' || '進行中') && (plan.due_date_at - now).to_i < 2
    end
    puts '成功'
  end
end
