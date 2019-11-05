class CreateItemTagwords < ActiveRecord::Migration[5.2]
  def change
    create_table :item_tagwords do |t|
      t.references :item, foreign_key: true
      t.references :tagword, foreign_key: true

      t.timestamps
    end
  end
end
