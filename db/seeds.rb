# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create(email: 'user@example.com', password: 'password')
u2 = User.create(email: 'user2@example.com', password: 'password')

b1 = u1.beers.create(name: 'Deschutes Mirror Pond')
b2 = u1.beers.create(name: 'Crappy IPA')
 
b3 = u2.beers.create(name: 'Steaming Shingle')
b4 = u2.beers.create(name: 'Blackstra Stout')