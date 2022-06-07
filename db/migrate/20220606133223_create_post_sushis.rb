class CreatePostSushis < ActiveRecord::Migration[6.1]
  def change
    create_table :post_sushis do |t|
      t.integer "end_user_id", null: false
      t.string "name", null: false
      t.integer "region", default: 0, null: false
      t.integer "prefecture", default: 0, null: false
      t.string "municipalities", null: false
      t.integer "price", default: 0, null: false
      t.integer "atmosphere", default: 0, null: false
      t.integer "lunch_dinner", default: 0, null: false
      t.text "memo", null: false

      t.timestamps
    end
  end
end
