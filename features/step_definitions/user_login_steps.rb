Given(/^a (\w+) volunteer$/) do |user_type|
  case user_type
  when 'regular'
    @user = Fabricate.build :user
    @user.roles = [:user]
    @user.save
  when 'trusted'
    @user = Fabricate.build :user
    @user.roles = [:user, :trusted]
    @user.save
  when 'admin'
    @user = Fabricate :user
    @user.roles = [:user, :admin]
    @user.save
  end
end

Given(/^volunteer is confirmed$/) do
  @user.confirm!
end

Given(/^volunteer is approved$/) do
  @user.approve!
end

Given(/^a signed in admin$/) do
  admin = Fabricate :user, confirmed_at: Time.now, approved: true
  admin.roles << :admin
  admin.save!
  sign_in_user admin
end

Given(/^a regular, confirmed volunteer$/) do
  @volunteer = Fabricate :user,
                         email: 'chunky@bacon.com',
                         roles: [:user],
                         confirmed_at: Time.now
end

Given(/^volunteer is confirmed and approved$/) do
  step 'volunteer is confirmed'
  step 'volunteer is approved'
end

Given(/^an approved volunteer$/) do
  step 'a regular volunteer'
  step 'volunteer is confirmed and approved'
end

Given(/^the volunteer has the "(.*?)" role$/) do |role|
  @user.roles << role
  @user.save!
end

Given(/^volunteer is signed in$/) do
  sign_in_user @user
end

