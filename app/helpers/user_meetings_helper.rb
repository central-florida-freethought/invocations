module UserMeetingsHelper
  def meeting_types
    [
      %w(Regular Regular),
      %w(Special Special),
      %w(Other Other)
    ]
  end

  def invocation_options
    [
      %w(Yes Yes),
      %w(No No),
      ['Moment of silence', 'Moment of silence']
    ]
  end

  def pledge_options
    [
      ['Immediately before', 'Immediately before'],
      ['Immediately after', 'Immediately after'],
      %w(Neither Neither),
      %w(Unknown Unknown)
    ]
  end

  def stand_options
    [
      ['Yes, by official/employee', 'Yes, by official/employee'],
      ['Yes, by speaker', 'Yes, by speaker'],
      %w(Both Both),
      %w(Neither Neither)
    ]
  end

  def speaker_options
    [
      ['Yes, Explain', 'Yes, Explain'],
      %w(No No),
      %w(Unknown Unknown)
    ]
  end

  def get_meeting_id_link(user_meeting, link_name)
    if current_user.nil?
      user_meeting.id
    elsif  current_user.has_role?(:admin)
      link_to(
        link_name, locality_user_meeting_path(user_meeting.locality, user_meeting))
    else
      user_meeting.id
    end
  end
end

