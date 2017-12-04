class RemovePhoneNumberFromUsersAddOpenId < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :phone_number, :bigint
    add_column :users, :open_id, :string
  end
end
