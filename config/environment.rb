# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# Time format used by Calendar Widget
Time::DATE_FORMATS[:event_date_time] = "%m/%d/%Y %H:%M %z"