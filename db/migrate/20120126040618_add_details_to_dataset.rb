class AddDetailsToDataset < ActiveRecord::Migration
  def change
    add_column :datasets, :user_id, :integer

    add_column :datasets, :marked_of_interest, :boolean

    add_column :datasets, :marked_complete, :boolean

  end
end
