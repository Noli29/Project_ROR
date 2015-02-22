
User.delete_all
Role.delete_all

Role.create(name: 'admin')
Role.create(:name => 'super_admin')

User.create(email: 'super@gmail.com', name:'SuperAdmin', password: '123', password_confirmation: '123')