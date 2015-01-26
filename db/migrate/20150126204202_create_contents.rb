class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.text :words
      t.references :page, index: true

      t.timestamps null: false
    end
    add_index :contents, [:page_id, :created_at]
  end
end
