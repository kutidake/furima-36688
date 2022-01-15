class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string :item_name,null: false
      t.text :explanation,null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :charge_id,null: false
      t.integer :area_id,null: false
      t.integer :scheduled_delivery_id,null: false
      t.integer :price,null: false
      t.references :user, foreign_key: true
    end
  end
end
