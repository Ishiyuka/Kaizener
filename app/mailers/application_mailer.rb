class ApplicationMailer < ActionMailer::Base
  # default from: Rails.application.credentials.gmail[:user_name]
  default from: ENV['USER_NAME']
  layout 'mailer'
end