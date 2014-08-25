Given 'a $user_type volunteer' do |user_type|
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

Given 'volunteer is confirmed' do
  @user.confirm!
end

Given 'volunteer is approved' do
  @user.approve!
end

Given 'volunteer is confirmed and approved' do
  step 'volunteer is confirmed'
  step 'volunteer is approved'
end

Given 'an approved volunteer' do
  step 'a regular volunteer'
  step 'volunteer is confirmed and approved'
end

Given 'the volunteer is trusted' do
  @user.roles << :trusted
  @user.save!
end

Given 'volunteer is signed in' do
  sign_in_user @user
end