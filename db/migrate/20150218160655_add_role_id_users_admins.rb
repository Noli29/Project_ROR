class AddRoleIdUsersAdmins < ActiveRecord::Migration
  def change
    add_column :users, :role_id, :integer, index: true
    add_column :admins, :role_id, :integer, index: true
  end


end
