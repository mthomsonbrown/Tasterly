class AddNameToflavorStats < ActiveRecord::Migration
  def change
    add_column :flavor_stats, :name, :string
  end
end
