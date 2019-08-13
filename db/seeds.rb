require 'faker'
User.destroy_all
Event.destroy_all
Attendance.destroy_all
  # Creation de 20 utilisateurs
  20.times do
    User.create(first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, description:Faker::Lorem.sentence, email: Faker::Internet.email)
  end

