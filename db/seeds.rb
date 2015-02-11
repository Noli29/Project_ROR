# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create(:name => "super_admin")
Role.create(:name => "admin")
super_admin = Admin.create({email: "super@gmail.com", password: "12345",username: "superAdmin"})
super_admin.role = Role.first