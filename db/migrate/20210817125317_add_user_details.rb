class AddUserDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :address, :string
    add_column :users, :profile_img, :string
    add_column :users, :phone, :integer

  end
end
