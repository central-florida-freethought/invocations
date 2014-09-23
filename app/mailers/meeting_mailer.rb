class MeetingMailer < ActionMailer::Base
  default from: "no-reply@#{Rails.application.secrets.domain_name}"

  def approval_request(meeting)
    @meeting = meeting
    @state = @meeting.aasm.current_state.to_s
    mail to: @meeting.user.email, subject: "Meeting #{@meeting.aasm.current_state}"
  end
end
