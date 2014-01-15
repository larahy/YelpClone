class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.text :name
      t.boolean :takeaway

      t.timestamps
    end
  end
end
