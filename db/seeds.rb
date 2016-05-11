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
station2 = Station.create(name: "Gym", location: "district 5, Ha Noi")
teacher1 = Teacher.create(name: "Tony")
teacher2 = Teacher.create(name: "Mary")
exercise1 = Exercise.create(name: "exercise1", description: "this exercise is for yoga")
exercise2 = Exercise.create(name: "exercise2", description: "this exercise is for gym")
Course.create(name: "course1", num_slot: 10, cover_img: Rails.root.join("app/assets/images/course1.jpeg").open, phone_number: "1234567890", website: "http://course1.com", description: "no description1", start_time: Time.now, end_time: Time.now, start_date: Time.now, teacher: teacher1, station: station1, exercise: exercise1, studio: studio)
Course.create(name: "course2", num_slot: 20, cover_img: Rails.root.join("app/assets/images/course2.png").open, phone_number: "1234567890", website: "http://course2.com", description: "no description2", start_time: Time.now, end_time: Time.now, start_date: Time.now, teacher: teacher1, station: station1, exercise: exercise1, studio: studio)
Course.create(name: "course3", num_slot: 30, cover_img: Rails.root.join("app/assets/images/course3.png").open, phone_number: "1234567890", website: "http://course3.com", description: "no description3", start_time: Time.now, end_time: Time.now, start_date: Time.now, teacher: teacher1, station: station1, exercise: exercise1, studio: studio)
Course.create(name: "course4", num_slot: 40, cover_img: Rails.root.join("app/assets/images/course4.png").open, phone_number: "1234567890", website: "http://course4.com", description: "no description4", start_time: Time.now, end_time: Time.now, start_date: Time.now, teacher: teacher1, station: station1, exercise: exercise1, studio: studio)


