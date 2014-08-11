class AddExtraFieldsToUserMeetings < ActiveRecord::Migration
  def change
    add_column :user_meetings, :minutes_url, :string
    add_column :user_meetings, :agenda_url, :string
    add_column :user_meetings, :media_url, :string
  end
end
