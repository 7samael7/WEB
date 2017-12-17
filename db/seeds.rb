# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Building.count.zero?
  buildings = []
  5.times do |i|
    buildings << Building.create!(title: "Building #{i}", code: "00#{i}" )
  end

  rooms = []
  buildings.each do |building|
    5.times do |i|
      rooms << Room.create!(title: "Room #{i}", code: "10#{i}", building: building)
    end
  end

  teacher = Teacher.create!(first_name: "Pepa", last_name: "Smoula", email: "pepa@nechce.cz")
  student = Student.create!(first_name: "Josef", last_name: "Zahradka", email: "josef@chce.cz")
  course = Course.create!(title: "Matika", code: "MA1")

  rooms.each do |room|
    Lesson.create!(start_at: Time.current, end_at: Time.current + 500.seconds, duration: 500.seconds, room: room, teacher: Teacher.first, course: Course.first)
  end

  TeacherAssignment.create!(teacher: teacher, course: course)
  StudentAssignment.create!(student: student, course: course)
end

