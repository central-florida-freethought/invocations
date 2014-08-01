class CreateLocalities < ActiveRecord::Migration
  def change
    create_table :localities do |t|
      t.string :name,         null: false
      t.string :city,         null: false
      t.string :country_code, null: false, limit: 2
      t.string :state_code,   null: false

      t.timestamps
    end
  end
end
