# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(email: "user@email.com", password: "123123123")
public_list = List.create(title: "Programming languages to learn" , user_id: user.id, opened: true)
private_list = List.create(title: "Private List" , user_id: user.id)

Task.create(description: "Ruby", finished_at: Time.zone.now, list_id: public_list.id)
Task.create(description: "Python", list_id: public_list.id)


u2 = User.create(email: "u2@email.com", password: "123123123")
pl = List.create(title: "Code School Courses" , user_id: u2.id, opened: true)

Task.create(description: "Mastering GitHub", finished_at: Time.zone.now, list_id: pl.id)
Task.create(description: "Front-end Foundations", list_id: pl.id)

Favorite.create(user_id: user.id, list_id: pl.id)

