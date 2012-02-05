class AddDetailsToDataset < ActiveRecord::Migration
  def change
    add_column :datasets, :user_id, :integer

    add_column :datasets, :status, :integer

  end
end
