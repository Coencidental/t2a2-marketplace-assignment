class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :bucket, foreign_key: true
      t.string :name
      t.string :brand
      t.text :description
      t.text :returnable
      t.decimal :price

      t.timestamps
    end
  end
end
