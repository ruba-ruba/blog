# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 
  Role.create([{:name => 'user'}, {:name => 'admin'}])
  User.create([{:email =>'admin@admin.com', password: '123456', password_confirmation: '123456'}])
  User.first.roles << Role.find_by_name('admin')