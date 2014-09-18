class NotificationsMailer < ActionMailer::Base

  default :from => 'noreply@invocationsonline.com'
  default :to => 'you@invocationsonline.com'

  def new_message(message)
    @message = message
    mail(:subject => "[Invocations Online] #{message.subject}")
  end

end