class ApplicationMailer < ActionMailer::Base
  # default from: Rails.application.credentials.gmail[:user_name]
  default from: 'from@example.com'
  layout 'mailer'
end