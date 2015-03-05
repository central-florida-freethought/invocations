# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# Time format used by Calendar Widget
Time::DATE_FORMATS[:date] = '%F'
Time::DATE_FORMATS[:time] = '%I:%M %p'
