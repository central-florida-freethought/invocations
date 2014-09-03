class ModifyUserMeetingValidations < ActiveRecord::Migration
  def change
    change_column :user_meetings, :pledge_before,    :string, null: true
    change_column :user_meetings, :asked_to_stand,   :string, null: true
    change_column :user_meetings, :speaker_preached, :text,   null: true
    change_column :user_meetings, :speaker_praised,  :text,   null: true
  end
end
