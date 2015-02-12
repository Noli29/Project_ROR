
Role.create(:name => "super_admin")
Role.create(:name => "admin")

super_admin = Admin.create({email: "super@gmail.com", password: "12345", name: "superAdmin"})
super_admin.role = Role.first