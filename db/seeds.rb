User.destroy_all
Event.destroy_all
Attendance.destroy_all


10.times do 
  user = User.create!(email: Faker::Internet.free_email, description: Faker::Movies::HarryPotter.quote, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: Faker::Internet.password)
end

10.times do 
  event = Event.create!(start_date: Faker::Date.forward, title: Faker::Book.title, description: Faker::Hacker.say_something_smart, location: Faker::TvShows::GameOfThrones.city, admin_id: rand(User.all.first.id..User.all.last.id))
end

10.times do 
  attendance = Attendance.create!(stripe_customer_id: Faker::Number.number(digits: 10.0), event_id: rand(Event.all.first.id..Event.all.last.id), user_id: rand(User.all.first.id..User.all.last.id))
end