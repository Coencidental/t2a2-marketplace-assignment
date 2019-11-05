class CreateTagwords < ActiveRecord::Migration[5.2]
  def change
    create_table :tagwords do |t|
      t.string :tag

      t.timestamps
    end
  end
end
