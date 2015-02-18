class AddRoleIdUsersAdmins < ActiveRecord::Migration
  def change
    add_column :users, :role_id, :integer
    add_column :admins, :role_id, :integer
  end


end
