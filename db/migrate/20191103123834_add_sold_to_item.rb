class AddSoldToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :sold, :boolean, default: false
  end
end
