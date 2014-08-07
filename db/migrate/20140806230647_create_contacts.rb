class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :title
      t.string :phone, null: false
      t.string :email, null: false
      t.string :street_address
      t.string :city
      t.string :state_code
      t.string :country_code
      t.string :zip
      t.text :notes

      t.timestamps
    end

    add_column :localities, :contact_id, :integer
  end
end
