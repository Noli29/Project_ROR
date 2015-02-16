Role.delete_all
Admin.delete_all

Role.create(:name => 'admin')
Role.create(:name => 'super_admin')

Admin.create(email: 'super@gmail.com', name:'SuperAdmin', password: '123',
             password_confirmation: '123')

#super_admin = Admin.new({email: "super@gmail.com", password: "123", password_confirmation: "123", name: "superAdmin"})
#super_admin.role = Role.first
#super_admin.save