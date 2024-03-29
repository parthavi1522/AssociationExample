class AddLockVersionToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :lock_version, :integer
  end
end
