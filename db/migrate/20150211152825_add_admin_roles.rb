class AddAdminRoles < ActiveRecord::Migration
  def change
    add_column :roles, :admin_id, :integer
  end
end
