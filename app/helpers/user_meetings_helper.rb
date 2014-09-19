module UserMeetingsHelper
  def meeting_types
    [['Choose', ''], ['Regular', 'Regular'], ['Special', 'Special'], ['Other', 'Other']]
  end

  def invocation_options
    [['Choose', ''], ['Yes', 'Yes'], ['No', 'No'], ['Moment of silence', 'Moment of silence']]
  end

  def pledge_options
    [['Choose', ''], [ 'Immediately before', 'Immediately before' ], ['Immediately after', 'Immediately after' ],
     ['Neither', 'Neither' ], ['Unknown', 'Unknown']]
  end

  def stand_options
    [['Choose', ''], ['Yes, by official/employee', 'Yes, by official/employee'],
     ['Yes, by speaker', 'Yes, by speaker'],
     ['Both', 'Both'], ['Neither', 'Neither']]
  end

  def speaker_options
    [['Choose', ''], ['Yes, Explain', 'Yes, Explain'],
      ['No', 'No'], ['Unknown', 'Unknown']]
  end
end
