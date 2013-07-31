# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
Event.destroy_all

Event.create(occurred_at: '5:00', actor: 'Bob', action: 'enters')
Event.create(occurred_at: '5:05', actor: 'Kate', action: 'enters')
Event.create(occurred_at: '5:15', actor: 'Rob', action: 'comments', content: 'Hey Kate- High five?')
Event.create(occurred_at: '5:17', actor: 'Bob', action: 'high fives', receiver: 'Kate')
Event.create(occurred_at: '5:18', actor: 'Bob', action: 'leaves')
Event.create(occurred_at: '5:20', actor: 'Kate', action: 'comments', content: "Oh Typical")
Event.create(occurred_at: '5:21', actor: 'Kate', action: 'leaves')


Event.create(occurred_at: '6:21', actor: 'Kate', action: 'leaves')
Event.create(occurred_at: '6:11', actor: 'Kate', action: 'enters')
