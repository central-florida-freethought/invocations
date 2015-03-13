class AddSlugToLocalities < ActiveRecord::Migration
  def change
    add_column :localities, :slug, :string, null: false
  end
end
