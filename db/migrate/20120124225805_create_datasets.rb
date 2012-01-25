class CreateDatasets < ActiveRecord::Migration
  def change
    create_table :datasets do |t|
      t.string :name
      t.string :mat_p
      t.string :geo_p
      t.string :mat_n
      t.string :geo_n

      t.timestamps
    end
  end
end
