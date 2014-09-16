class AddPhoneNumberToLocalities < ActiveRecord::Migration
  def change
    add_column :localities, :phone_number, :string
    add_column :localities, :contact_name, :string
    add_column :localities, :contact_title, :string
    add_column :localities, :contact_phone, :string
    add_column :localities, :contact_email, :string
    add_column :localities, :contact_street_address, :string
    add_column :localities, :contact_city, :string
    add_column :localities, :contact_country_code, :string
    add_column :localities, :contact_state_code, :string
    add_column :localities, :contact_zip, :string
    add_column :localities, :contact_notes, :text
  end
end
