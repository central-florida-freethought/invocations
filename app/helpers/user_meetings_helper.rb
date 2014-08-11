module UserMeetingsHelper
  def meeting_types
    ['regular', 'special', 'workshop', 'other']
  end

  def invocation_options
    ['yes', 'no', 'moment of silence']
  end

  def pledge_options
    ['immediately before', 'immediately after', 'neither', 'unknown']
  end

  def stand_options
    ['yes, by official/employee', 'yes, by speaker', 'both', 'neither', 'unknown']
  end

  def speaker_options
    ['yes, explain', 'no', 'unknown']
  end
end
