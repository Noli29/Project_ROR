
User.delete_all
Role.delete_all

r = Role.create(:name => 'super_admin')
User.create(email: 'super@gmail.com', name:'SuperAdmin', password: '123', password_confirmation: '123', role_id: r.id)