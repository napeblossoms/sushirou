class CreateDictionaries < ActiveRecord::Migration[6.1]
  def change
    create_table :dictionaries do |t|
      t.string "name", null: false
      t.string "body", null: false
      t.string "season", null: false
      t.timestamps
    end
  end
end
