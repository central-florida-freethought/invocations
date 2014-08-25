class AddExplanationsToUserMeetings < ActiveRecord::Migration
  def change
    add_column :user_meetings, :speaker_preached_explanation, :text
    add_column :user_meetings, :speaker_praised_explanation, :text
  end
end
