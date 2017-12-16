# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |i|
  Building.create(title: "Building #{i}", code: "00#{i}" )
end

Building.all.each do |building|
  5.times do |i|
    Room.create(title: "Room #{i}", code: "10#{i}", building: building)
  end
end

Room.all.each do |room|
  Lesson.create(start_at: Time.current, end_at: Time.current + 500.seconds, duration: 500.seconds, room: room)
end
