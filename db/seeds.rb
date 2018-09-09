# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create({first_name: 'brandon', last_name: 'harris', username: 'player1', password: '1234', is_deleted: false, email:'test@test.com'})
user2 = User.create({first_name: 'lain', last_name: 'boe', username: 'player2', password: '1234', is_deleted: false, email: 'create@create.com'})
user3 = User.create({first_name: 'ekko', last_name: 'apc', username: 'player3', password: '1234', is_deleted: false, email: 'league@legends.com'})

concert = EventType.create(event_description: 'Concert', is_deleted: false)
game = EventType.create(event_description: 'Basketball Game', is_deleted: false)

msg = Arena.create(arena_name: 'MSG', city: 'New York City', state: 'NY', is_deleted: false)
barclays = Arena.create(arena_name: 'Barclays', city: 'Brooklyn', state: 'NY', is_deleted: false)

event2 = Event.create(arena: msg, event_type: game, max_winners: 2, event_datetime: DateTime.now, description: "NY Knicks vs LA Lakers")
event3 = Event.create(arena: msg, event_type: concert, max_winners: 10, event_datetime: DateTime.now, description: "Beyonce Concert")
event4 = Event.create(arena: msg, event_type: game, max_winners: 2, event_datetime: DateTime.now, description: "NY Knicks vs GS Warriors")

drawing1 = Drawing.create(event: event2, user: user3, is_drawing_winner: false)
drawing2 = Drawing.create(event: event3, user: user1, is_drawing_winner: true)
