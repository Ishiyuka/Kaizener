require 'date'
require Rails.root.join('/app/models/plan')
class Batch::MailBatch
  def self.run
    puts '--- Batch::MailBatch.run ---'
    @today = Time.zone.today
    if plan.status == (0 || 1) && (plan.due_date_at - @today).to_i < 2
      Plan.all.each do |plan|
        RemindMailer.remind_action(plan).deliver
      end
    end
  end
end
