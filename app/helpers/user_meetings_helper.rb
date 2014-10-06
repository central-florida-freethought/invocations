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
end

