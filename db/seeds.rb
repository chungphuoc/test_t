studio = Studio.create()
User.create(email: "studio@tone.com", name: "Studio", password: "12345678", password_confirmation: "12345678", role_id: studio.id, role_type: "Studio")
station1 = Station.create(name: "Yoga", location: "district 10, Ho Chi Minh City")
station2 = Station.create(name: "Gym", location: "district 5, Ha Noi")
teacher1 = Teacher.create(name: "Tony")
teacher2 = Teacher.create(name: "Mary")
exercise1 = Exercise.create(name: "exercise1", description: "this exercise is for yoga")
exercise2 = Exercise.create(name: "exercise2", description: "this exercise is for gym")
Course.create(name: "course1", num_slot: 10, cover_img: Rails.root.join("app/assets/images/gym.jpg").open, phone_number: "1234567890", website: "http://course1.com", description: "no description", start_time: Time.now, end_time: Time.now, start_date: Time.now, teacher: teacher1, station: station1, exercise: exercise1, studio: studio)


