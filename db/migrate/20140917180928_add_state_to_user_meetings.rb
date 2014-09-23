class AddStateToUserMeetings < ActiveRecord::Migration
  def change
    add_column :user_meetings, :aasm_state, :string
    remove_column :user_meetings, :pending
  end
end
