# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_meeting do
    meeting_type 'Regular'
    meeting_time "2014-07-31 15:24:13"
    invocation_conducted "yes"
    pledge_before "immediately before"
    asked_to_stand "yes, by official/employee"
    speaker_preached "no"
    speaker_praised "no"
    concerns "Bacon ipsum dolor sit amet in aliquip et rump, ad minim velit spare ribs. Non doner labore proident in porchetta adipisicing bresaola pariatur minim tri-tip in fugiat pancetta hamburger."
    attachment ""
    locality
    user
    association :speaker, strategy: :build
  end
end
