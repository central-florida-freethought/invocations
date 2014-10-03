class VolunteerMailer < ActionMailer::Base
  default from: "no-reply@#{Rails.application.secrets.domain_name}"

  def approved_email(user)
    @user = user
    mail to: @user.email, subject: t('devise.mailer.approval.subject')
  end

  def deactivated_email(user)
    @user = user
    mail to: @user.email, subject: t('devise.mailer.deactivated.subject')
  end
end

