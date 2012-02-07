class AddDistanceToDataset < ActiveRecord::Migration
  def change
    add_column :datasets, :dist, :float, default:0
    add_column :datasets, :comment, :string
  end
end
