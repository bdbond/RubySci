class CreateData < ActiveRecord::Migration
  def change
    create_table :data do |t|
      t.integer :dataset_id
      t.float :pressure
      t.float :voltage
      t.float :amperage

      t.timestamps
    end
  end
end
