class CreateFlavorStats < ActiveRecord::Migration
  def change
    create_table :flavor_stats do |t|

      t.timestamps null: false
    end
  end
end
