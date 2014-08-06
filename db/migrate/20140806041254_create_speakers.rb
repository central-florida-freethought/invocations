class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :name
      t.string :honorific
      t.belongs_to :organization
      t.belongs_to :religion
      t.belongs_to :denomination

      t.timestamps
    end

    add_column :user_meetings, :speaker_id, :integer
  end
end
