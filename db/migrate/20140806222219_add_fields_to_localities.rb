class AddFieldsToLocalities < ActiveRecord::Migration
  def change
    add_column :localities, :street_address, :string, null: false
    add_column :localities, :zip, :string, null: false
    add_column :localities, :location_notes, :text
    add_column :localities, :website_url, :string
    add_column :localities, :volunteer_needed, :boolean, null: false
    add_column :localities, :meeting_data_url, :string
    add_column :localities, :meeting_schedule, :string
    add_column :localities, :invocations_conducted, :boolean, null: false
  end
end
