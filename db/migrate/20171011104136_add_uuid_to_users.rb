class AddUuidToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :uuid, :uuid
  end
end
