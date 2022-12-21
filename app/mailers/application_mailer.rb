class ApplicationMailer < ActionMailer::Base
  # default from: Rails.application.credentials.gmail[:user_name]
  default from: ENV['SEND_MAIL']
  layout 'mailer'
end
