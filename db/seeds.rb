# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(display_name: 'Calvin Correli', email: 'calvin@test.com', password: 'password')
User.create(display_name: 'Owais Khan', email: 'owais@test.com', password: 'password')
User.create(display_name: 'Jason Barnabe', email: 'json@test.com', password: 'password')
User.create(display_name: 'Beth Barnabe', email: 'beth@test.com', password: 'password')

Group.create(name: 'First Group', creator: User.first)
Group.create(name: 'Second Group', creator: User.second)
Group.create(name: 'Third Group', creator: User.third)

group = Group.first
group.users << User.where.not(id: group.creator_id).limit(2)

group = Group.second
group.users << User.where.not(id: group.creator_id).limit(5)
