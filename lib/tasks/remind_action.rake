namespace :remind_action do
  desc "毎朝9時に期限が2日前のアクションをリマインド"
  task reminder: :environment do
    Team.all.each do |team|
      if team.plans.present?
        RemindMailer.remind_action(team).deliver_now
      end
    end
  end
end
