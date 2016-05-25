Enrollment.delete_all
Course.delete_all
Station.delete_all
Teacher.delete_all
Exercise.delete_all
Customer.delete_all
Studio.delete_all
User.delete_all

studio = Studio.create
stuidio_goldenowl = Studio.create
customer = Customer.create
customer_toan = Customer.create
customer_user = User.create!(email: 'customer@tone.com', name: 'Customer', password: '12345678', 
            password_confirmation: '12345678', role_id: customer.id, role_type: 'Customer',
            avatar: Rails.root.join('app/assets/images/user1.jpeg').open)
User.create(email: 'studio@tone.com', name: 'Studio', password: '12345678',
            password_confirmation: '12345678', role_id: studio.id, role_type: 'Studio',
            avatar: Rails.root.join('app/assets/images/user2.png').open)
User.create(email: 'golden.owl.test@gmail.com', name: 'Golden Owl', password: '12345678', 
            password_confirmation: '12345678', role_id: stuidio_goldenowl.id, role_type: 'Studio',
            avatar: Rails.root.join('app/assets/images/user3.jpeg').open)
User.create(email: 'ductoan593@gmail.com', name: 'Ductoan', password: '12345678', 
            password_confirmation: '12345678', role_id: customer_toan.id, role_type: 'Customer',
            avatar: Rails.root.join('app/assets/images/user4.jpeg').open)

station1 = Station.create(name: 'Yoga', location: 'district 10, Ho Chi Minh City')
station2 = Station.create(name: 'Bad', location: 'district 5, Ha Noi')
station3 = Station.create(name: 'Soc', location: 'Da Nang City')
station4 = Station.create(name: 'Vol', location: 'Hoi An')
station5 = Station.create(name: 'Bas', location: '356, Buon Me Thuot')
station6 = Station.create(name: 'Swi', location: '256, Ly Thuong Kiet, Daklak')

teacher1 = Teacher.create(name: 'Tony')
teacher2 = Teacher.create(name: 'Mary')
teacher3 = Teacher.create(name: 'Tom')
teacher4 = Teacher.create(name: 'Alex')
teacher5 = Teacher.create(name: 'Rick')
teacher6 = Teacher.create(name: 'Glenn')

exercise1 = Exercise.create(name: 'exercise1', description: 'this exercise is for yoga')
exercise2 = Exercise.create(name: 'exercise2', description: 'this exercise is for gym')
exercise3 = Exercise.create(name: 'exercise3', description: 'this exercise is for sim')
exercise4 = Exercise.create(name: 'exercise4', description: 'this exercise is for bad')
exercise5 = Exercise.create(name: 'exercise5', description: 'this exercise is for soc')
exercise6 = Exercise.create(name: 'exercise6', description: 'this exercise is for vol')

course1 = Course.create(name: 'Yoga Course', num_slot: 10, 
              cover_img: Rails.root.join('app/assets/images/yoga1.jpg').open, 
              phone_number: '1234567890', website: 'http://course1.com', 
              description: 'no description1', start_time: Time.now, 
              end_time: Time.now, start_date: Time.now, teacher: teacher1, 
              station: station1, exercise: exercise1, studio: studio,
              tuition: 100.0, currency: 'usd')
course2 = Course.create(name: 'Gym Course', num_slot: 20,
              cover_img: Rails.root.join('app/assets/images/yoga2.jpg').open, 
              phone_number: '1234567890', website: 'http://course2.com', 
              description: 'no description2', start_time: Time.now, 
              end_time: Time.now, start_date: Time.now, teacher: teacher2, 
              station: station2, exercise: exercise2, studio: studio,
              tuition: 200.0, currency: 'usd')
course3 = Course.create(name: 'Swim Course', num_slot: 30, 
              cover_img: Rails.root.join('app/assets/images/yoga3.jpg').open, 
              phone_number: '1234567890', website: 'http://course3.com', 
              description: 'no description3', start_time: Time.now, 
              end_time: Time.now, start_date: Time.now, teacher: teacher3, 
              station: station3, exercise: exercise3, studio: stuidio_goldenowl,
              tuition: 300.0, currency: 'usd')
course4 = Course.create(name: 'Soc Course', num_slot: 40, 
              cover_img: Rails.root.join('app/assets/images/yoga4.jpg').open, 
              phone_number: '1234567890', website: 'http://course4.com', 
              description: 'no description4', start_time: Time.now, 
              end_time: Time.now, start_date: Time.now, teacher: teacher4, 
              station: station4, exercise: exercise4, studio: stuidio_goldenowl,
              tuition: 400.0, currency: 'usd')
course5 = Course.create(name: 'Spring Yoga', num_slot: 10, 
              cover_img: Rails.root.join('app/assets/images/yoga5.jpg').open, 
              phone_number: '1234567890', website: 'http://course1.com', 
              description: 'no description1', start_time: Time.now, 
              end_time: Time.now, start_date: Time.now, teacher: teacher5, 
              station: station5, exercise: exercise5, studio: studio,
              tuition: 500.0, currency: 'usd')
course6 = Course.create(name: 'Summer Gym', num_slot: 20, 
              cover_img: Rails.root.join('app/assets/images/yoga6.jpg').open, 
              phone_number: '1234567890', website: 'http://course2.com', 
              description: 'no description2', start_time: Time.now, 
              end_time: Time.now, start_date: Time.now, teacher: teacher6, 
              station: station6, exercise: exercise6, studio: studio,
              tuition: 600.0, currency: 'usd')
course7 = Course.create(name: 'Winter Soc', num_slot: 30, 
              cover_img: Rails.root.join('app/assets/images/yoga7.jpg').open, 
              phone_number: '1234567890', website: 'http://course3.com', 
              description: 'no description3', start_time: Time.now, 
              end_time: Time.now, start_date: Time.now, teacher: teacher1, 
              station: station1, exercise: exercise1, studio: stuidio_goldenowl,
              tuition: 700.0, currency: 'usd')
course8 = Course.create(name: 'City Yoga', num_slot: 40, 
              cover_img: Rails.root.join('app/assets/images/yoga8.jpg').open, 
              phone_number: '1234567890', website: 'http://course4.com', 
              description: 'no description4', start_time: Time.now, 
              end_time: Time.now, start_date: Time.now, teacher: teacher2, 
              station: station2, exercise: exercise2, studio: stuidio_goldenowl,
              tuition: 800.0, currency: 'usd')
course9 = Course.create(name: 'Oversea Doc', num_slot: 10, 
              cover_img: Rails.root.join('app/assets/images/yoga9.jpg').open, 
              phone_number: '1234567890', website: 'http://course1.com', 
              description: 'no description1', start_time: Time.now, 
              end_time: Time.now, start_date: Time.now, teacher: teacher3, 
              station: station3, exercise: exercise3, studio: studio,
              tuition: 900.0, currency: 'usd')
course10 = Course.create(name: 'Demo Gym', num_slot: 20, 
              cover_img: Rails.root.join('app/assets/images/yoga10.jpg').open, 
              phone_number: '1234567890', website: 'http://course2.com', 
              description: 'no description2', start_time: Time.now, 
              end_time: Time.now, start_date: Time.now, teacher: teacher4, 
              station: station4, exercise: exercise4, studio: studio,
              tuition: 150.0, currency: 'usd')
course11 = Course.create(name: 'Pro Swim', num_slot: 30, 
              cover_img: Rails.root.join('app/assets/images/yoga11.jpg').open, 
              phone_number: '1234567890', website: 'http://course3.com', 
              description: 'no description3', start_time: Time.now, 
              end_time: Time.now, start_date: Time.now, teacher: teacher5, 
              station: station5, exercise: exercise5, studio: stuidio_goldenowl,
              tuition: 160.0, currency: 'usd')
course12 = Course.create(name: 'Basic Bad', num_slot: 40, 
              cover_img: Rails.root.join('app/assets/images/yoga12.jpg').open, 
              phone_number: '1234567890', website: 'http://course4.com', 
              description: 'no description4', start_time: Time.now, 
              end_time: Time.now, start_date: Time.now, teacher: teacher6, 
              station: station6, exercise: exercise6, studio: stuidio_goldenowl,
              tuition: 170.0, currency: 'usd')

customer_user.enrollments.create(course_id: course1.id)
customer_user.enrollments.create(course_id: course2.id)
customer_user.enrollments.create(course_id: course3.id)
customer_user.enrollments.create(course_id: course4.id)