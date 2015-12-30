class CreateFlavors < ActiveRecord::Migration
  def change
    create_table :flavors do |t|
      t.string :name
      t.string :rating
      t.references :user, index: true, foreign_key: true
      t.references :beer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
