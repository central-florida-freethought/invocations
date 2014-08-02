# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_meeting do
    meeting_time "2014-07-31 15:24:13"
    invocation_conducted "MyString"
    pledge_before "MyString"
    asked_to_stand "MyString"
    speaker_preached "MyText"
    speaker_praised "MyText"
    concerns "MyText"
    attachment ""
    user
  end
end
