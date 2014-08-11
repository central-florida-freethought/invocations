class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone_number, :string, null: false
    add_column :users, :locality_id,  :integer
    add_column :users, :approved, :boolean, default: false, null: false

    add_index  :users, :approved
    add_index  :users, :first_name
    add_index  :users, :last_name
  end
end
