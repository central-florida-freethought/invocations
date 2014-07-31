class CreateUserMeetings < ActiveRecord::Migration
  def change
    create_table :user_meetings do |t|
      t.datetime :meeting_time,         null: false
      t.string   :invocation_conducted, null: false
      t.string   :pledge_before,        null: false
      t.string   :asked_to_stand,       null: false
      t.text     :speaker_preached,     null: false
      t.text     :speaker_praised,      null: false
      t.text     :concerns
      t.binary   :attachment
      t.boolean  :pending
      t.integer  :user_id

      t.timestamps
    end
  end
end
