class CreateDenominations < ActiveRecord::Migration
  def change
    create_table :denominations do |t|
      t.string :name

      t.timestamps
    end
  end
end
