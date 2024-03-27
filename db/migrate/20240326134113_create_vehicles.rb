class CreateVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles do |t|
      t.string :type, default: ''
      t.string :make
      t.string :model
      t.integer :year
      t.string :color
      t.string :towing_capacity
      t.string :engine_size

      t.timestamps
    end
  end
end
