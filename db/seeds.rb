Enrollment.delete_all
Course.delete_all
Station.delete_all
Teacher.delete_all
Exercise.delete_all
Customer.delete_all
Studio.delete_all
User.delete_all

studio = Studio.create()
stuidio_goldenowl = Studio.create()
customer = Customer.create()
customer_toan = Customer.create()
User.create!(email: "customer@tone.com", name: "Customer", password: "12345678", password_confirmation: "12345678", role_id: customer.id, role_type: "Customer")
User.create(email: "studio@tone.com", name: "Studio", password: "12345678", password_confirmation: "12345678", role_id: studio.id, role_type: "Studio")
User.create(email: "golden.owl.test@gmail.com", name: "Golden Owl", password: "12345678", password_confirmation: "12345678", role_id: stuidio_goldenowl.id, role_type: "Studio")
User.create(email: "ductoan593@gmail.com", name: "Ductoan", password: "12345678", password_confirmation: "12345678", role_id: customer_toan.id, role_type: "Customer")

station1 = Station.create(name: "Yoga", location: "district 10, Ho Chi Minh City")
station2 = Station.create(name: "Bad", location: "district 5, Ha Noi")
station3 = Station.create(name: "Soc", location: "Da Nang City")
station4 = Station.create(name: "Vol", location: "Hoi An")
station5 = Station.create(name: "Bas", location: "356, Buon Me Thuot")
station6 = Station.create(name: "Swi", location: "256, Ly Thuong Kiet, Daklak")

teacher1 = Teacher.create(name: "Tony")
teacher2 = Teacher.create(name: "Mary")
teacher3 = Teacher.create(name: "Tom")
teacher4 = Teacher.create(name: "Alex")
teacher5 = Teacher.create(name: "Rick")
teacher6 = Teacher.create(name: "Glenn")

exercise1 = Exercise.create(name: "exercise1", description: "this exercise is for yoga")
exercise2 = Exercise.create(name: "exercise2", description: "this exercise is for gym")
exercise3 = Exercise.create(name: "exercise3", description: "this exercise is for sim")
exercise4 = Exercise.create(name: "exercise4", description: "this exercise is for bad")
exercise5 = Exercise.create(name: "exercise5", description: "this exercise is for soc")
exercise6 = Exercise.create(name: "exercise6", description: "this exercise is for vol")

Course.create(name: "Yoga Course", num_slot: 10, cover_img: Rails.root.join("app/assets/images/yoga1.jpg").open, phone_number: "1234567890", website: "http://course1.com", description: "no description1", start_time: Time.now, end_time: Time.now, start_date: Time.now, teacher: teacher1, station: station1, exercise: exercise1, studio: studio)
Course.create(name: "Gym Course", num_slot: 20, cover_img: Rails.root.join("app/assets/images/yoga2.jpg").open, phone_number: "1234567890", website: "http://course2.com", description: "no description2", start_time: Time.now, end_time: Time.now, start_date: Time.now, teacher: teacher2, station: station2, exercise: exercise2, studio: studio)
Course.create(name: "Swim Course", num_slot: 30, cover_img: Rails.root.join("app/assets/images/yoga3.jpg").open, phone_number: "1234567890", website: "http://course3.com", description: "no description3", start_time: Time.now, end_time: Time.now, start_date: Time.now, teacher: teacher3, station: station3, exercise: exercise3, studio: stuidio_goldenowl)
Course.create(name: "Soc Course", num_slot: 40, cover_img: Rails.root.join("app/assets/images/yoga4.jpg").open, phone_number: "1234567890", website: "http://course4.com", description: "no description4", start_time: Time.now, end_time: Time.now, start_date: Time.now, teacher: teacher4, station: station4, exercise: exercise4, studio: stuidio_goldenowl)
Course.create(name: "Spring Yoga", num_slot: 10, cover_img: Rails.root.join("app/assets/images/yoga5.jpg").open, phone_number: "1234567890", website: "http://course1.com", description: "no description1", start_time: Time.now, end_time: Time.now, start_date: Time.now, teacher: teacher5, station: station5, exercise: exercise5, studio: studio)
Course.create(name: "Summer Gym", num_slot: 20, cover_img: Rails.root.join("app/assets/images/yoga6.jpg").open, phone_number: "1234567890", website: "http://course2.com", description: "no description2", start_time: Time.now, end_time: Time.now, start_date: Time.now, teacher: teacher6, station: station6, exercise: exercise6, studio: studio)
Course.create(name: "Winter Soc", num_slot: 30, cover_img: Rails.root.join("app/assets/images/yoga7.jpg").open, phone_number: "1234567890", website: "http://course3.com", description: "no description3", start_time: Time.now, end_time: Time.now, start_date: Time.now, teacher: teacher1, station: station1, exercise: exercise1, studio: stuidio_goldenowl)
Course.create(name: "City Yoga", num_slot: 40, cover_img: Rails.root.join("app/assets/images/yoga8.jpg").open, phone_number: "1234567890", website: "http://course4.com", description: "no description4", start_time: Time.now, end_time: Time.now, start_date: Time.now, teacher: teacher2, station: station2, exercise: exercise2, studio: stuidio_goldenowl)
Course.create(name: "Oversea Doc", num_slot: 10, cover_img: Rails.root.join("app/assets/images/yoga9.jpg").open, phone_number: "1234567890", website: "http://course1.com", description: "no description1", start_time: Time.now, end_time: Time.now, start_date: Time.now, teacher: teacher3, station: station3, exercise: exercise3, studio: studio)
Course.create(name: "Demo Gym", num_slot: 20, cover_img: Rails.root.join("app/assets/images/yoga10.jpg").open, phone_number: "1234567890", website: "http://course2.com", description: "no description2", start_time: Time.now, end_time: Time.now, start_date: Time.now, teacher: teacher4, station: station4, exercise: exercise4, studio: studio)
Course.create(name: "Pro Swim", num_slot: 30, cover_img: Rails.root.join("app/assets/images/yoga11.jpg").open, phone_number: "1234567890", website: "http://course3.com", description: "no description3", start_time: Time.now, end_time: Time.now, start_date: Time.now, teacher: teacher5, station: station5, exercise: exercise5, studio: stuidio_goldenowl)
Course.create(name: "Basic Bad", num_slot: 40, cover_img: Rails.root.join("app/assets/images/yoga12.jpg").open, phone_number: "1234567890", website: "http://course4.com", description: "no description4", start_time: Time.now, end_time: Time.now, start_date: Time.now, teacher: teacher6, station: station6, exercise: exercise6, studio: stuidio_goldenowl)



