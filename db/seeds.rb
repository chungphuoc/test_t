Enrollment.delete_all
Course.delete_all
Station.delete_all
Teacher.delete_all
Exercise.delete_all
Customer.delete_all
Studio.delete_all
User.delete_all

admin = Admin.create!
studio = Studio.create!(website: 'http://studio.com', facility: [], 
                        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur')
studio_goldenowl = Studio.create!(website: 'http://studio.com', facility: [], 
                                  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur')
customer = Customer.create!
customer_toan = Customer.create!

User.create!(email: 'admin@tone.com', name: 'Admin', password: '12345678',
            password_confirmation: '12345678', role_id: admin.id, role_type: 'Admin',
            avatar: Rails.root.join('app/assets/images/user1.jpeg').open,
            contact_number: '0123456789', confirmed_at: Time.now,
            address: '497 Hoa Hao, district 10, Ho Chi Minh city')
customer_user = User.create!(email: 'customer@tone.com', name: 'Customer', password: '12345678', 
            password_confirmation: '12345678', role_id: customer.id, role_type: 'Customer',
            avatar: Rails.root.join('app/assets/images/user1.jpeg').open,
            contact_number: '0123456789', confirmed_at: Time.now,
            address: '497 Hoa Hao, district 10, Ho Chi Minh city')
User.create!(email: 'studio@tone.com', name: 'Studio', password: '12345678',
            password_confirmation: '12345678', role_id: studio.id, role_type: 'Studio',
            avatar: Rails.root.join('app/assets/images/user2.png').open,
            contact_number: '0123456789', confirmed_at: Time.now,
            address: '497 Hoa Hao, district 10, Ho Chi Minh city')
User.create!(email: 'golden.owl.test@gmail.com', name: 'Golden Owl', password: '12345678', 
            password_confirmation: '12345678', role_id: studio_goldenowl.id, role_type: 'Studio',
            avatar: Rails.root.join('app/assets/images/user3.jpeg').open,
            contact_number: '0123456789', confirmed_at: Time.now,
            address: '497 Hoa Hao, district 10, Ho Chi Minh city')
User.create!(email: 'ductoan593@gmail.com', name: 'Ductoan', password: '12345678', 
            password_confirmation: '12345678', role_id: customer_toan.id, role_type: 'Customer',
            avatar: Rails.root.join('app/assets/images/user4.jpeg').open,
            contact_number: '0123456789', confirmed_at: Time.now,
            address: '497 Hoa Hao, district 10, Ho Chi Minh city')

station1 = Station.create!(name: 'Parkson', location: 'district 10, Ho Chi Minh City', latitude: 10.762622, longitude: 106.660172)
station2 = Station.create!(name: 'Lotteria', location: 'district 5, Ha Noi', latitude: 10.762622, longitude: 106.660172)
station3 = Station.create!(name: 'Diamon', location: 'Da Nang City', latitude: 10.762622, longitude: 106.660172)
station4 = Station.create!(name: 'Gold', location: 'Hoi An', latitude: 10.762622, longitude: 106.660172)
station5 = Station.create!(name: 'KFC', location: '356, Buon Me Thuot', latitude: 10.762622, longitude: 106.660172)
station6 = Station.create!(name: 'New World', location: '256, Ly Thuong Kiet, Daklak', latitude: 10.762622, longitude: 106.660172)
station7 = Station.create!(name: 'Waseco', location: 'Ben Tre', latitude: 10.762622, longitude: 106.660172)
station8 = Station.create!(name: 'Marid', location: 'district 5, Binh Thuan', latitude: 10.762622, longitude: 106.660172)
station9 = Station.create!(name: 'Chelsea', location: 'district 14, Da Nang City', latitude: 10.762622, longitude: 106.660172)
station10 = Station.create!(name: 'Arsenal', location: '987, Hoi An', latitude: 10.762622, longitude: 106.660172)
station11 = Station.create!(name: 'Caravelle', location: 'ward 9, district 5, Buon Me Thuot', latitude: 10.762622, longitude: 106.660172)
station12 = Station.create!(name: 'Majestic', location: '256, Ly Thuong Kiet street, Dak Nong', latitude: 10.762622, longitude: 106.660172)

teacher1 = Teacher.create!(name: 'Tony') #studio
teacher2 = Teacher.create!(name: 'Mary') #studio
teacher3 = Teacher.create!(name: 'Tom') #studio
teacher4 = Teacher.create!(name: 'Alex') #studio
teacher5 = Teacher.create!(name: 'Rick') #studio
teacher6 = Teacher.create!(name: 'Glenn') #studio
teacher7 = Teacher.create!(name: 'Bob') #studio_goldenowl
teacher8 = Teacher.create!(name: 'Ronando') #studio_goldenowl
teacher9 = Teacher.create!(name: 'Messi') #studio_goldenowl
teacher10 = Teacher.create!(name: 'Daniel') #studio_goldenowl
teacher11 = Teacher.create!(name: 'Daryl') #studio_goldenowl
teacher12 = Teacher.create!(name: 'Jonh') #studio_goldenowl

exercise1 = Exercise.create!(name: 'exercise1', description: 'this exercise is for yoga')
exercise2 = Exercise.create!(name: 'exercise2', description: 'this exercise is for gym')
exercise3 = Exercise.create!(name: 'exercise3', description: 'this exercise is for sim')
exercise4 = Exercise.create!(name: 'exercise4', description: 'this exercise is for bad')
exercise5 = Exercise.create!(name: 'exercise5', description: 'this exercise is for soc')
exercise6 = Exercise.create!(name: 'exercise6', description: 'this exercise is for vol')
exercise7 = Exercise.create!(name: 'exercise7', description: 'this exercise is for yoga')
exercise8 = Exercise.create!(name: 'exercise8', description: 'this exercise is for gym')
exercise9 = Exercise.create!(name: 'exercise9', description: 'this exercise is for sim')
exercise10 = Exercise.create!(name: 'exercise10', description: 'this exercise is for bad')
exercise11 = Exercise.create!(name: 'exercise11', description: 'this exercise is for soc')
exercise12 = Exercise.create!(name: 'exercise12', description: 'this exercise is for vol')

studio.contracts.create!(teacher_id: teacher1.id)
studio.contracts.create!(teacher_id: teacher2.id)
studio.contracts.create!(teacher_id: teacher3.id)
studio.contracts.create!(teacher_id: teacher4.id)
studio.contracts.create!(teacher_id: teacher5.id)
studio.contracts.create!(teacher_id: teacher6.id)
studio_goldenowl.contracts.create!(teacher_id: teacher7.id)
studio_goldenowl.contracts.create!(teacher_id: teacher8.id)
studio_goldenowl.contracts.create!(teacher_id: teacher9.id)
studio_goldenowl.contracts.create!(teacher_id: teacher10.id)
studio_goldenowl.contracts.create!(teacher_id: teacher11.id)
studio_goldenowl.contracts.create!(teacher_id: teacher12.id)

studio.branches.create!(station_id: station1.id)
studio.branches.create!(station_id: station2.id)
studio.branches.create!(station_id: station3.id)
studio.branches.create!(station_id: station4.id)
studio.branches.create!(station_id: station5.id)
studio.branches.create!(station_id: station6.id)
studio_goldenowl.branches.create!(station_id: station7.id)
studio_goldenowl.branches.create!(station_id: station8.id)
studio_goldenowl.branches.create!(station_id: station9.id)
studio_goldenowl.branches.create!(station_id: station10.id)
studio_goldenowl.branches.create!(station_id: station11.id)
studio_goldenowl.branches.create!(station_id: station12.id)

studio.services.create!(exercise_id: exercise1.id)
studio.services.create!(exercise_id: exercise2.id)
studio.services.create!(exercise_id: exercise3.id)
studio.services.create!(exercise_id: exercise4.id)
studio.services.create!(exercise_id: exercise5.id)
studio.services.create!(exercise_id: exercise6.id)
studio_goldenowl.services.create!(exercise_id: exercise7.id)
studio_goldenowl.services.create!(exercise_id: exercise8.id)
studio_goldenowl.services.create!(exercise_id: exercise9.id)
studio_goldenowl.services.create!(exercise_id: exercise10.id)
studio_goldenowl.services.create!(exercise_id: exercise11.id)
studio_goldenowl.services.create!(exercise_id: exercise12.id)

course1 = Course.create!(name: 'Yoga Course', num_slot: 10, 
              cover_img: Rails.root.join('app/assets/images/yoga1.jpg').open, 
              phone_number: '1234567890', website: 'http://course1.com', 
              description: 'no description1', start_time: Time.now, 
              end_time: 1.hour.from_now, start_date:  20.days.from_now, teacher: teacher1, 
              station: station1, exercise: exercise1, studio: studio,
              tuition: 100.0, currency: 'usd', kcal: 40, days_of_week: [1])
course2 = Course.create!(name: 'Gym Course', num_slot: 20,
              cover_img: Rails.root.join('app/assets/images/yoga2.jpg').open, 
              phone_number: '1234567890', website: 'http://course2.com', 
              description: 'no description2', start_time: Time.now, 
              end_time: 2.hour.from_now, start_date: 30.days.from_now, teacher: teacher2, 
              station: station2, exercise: exercise2, studio: studio,
              tuition: 200.0, currency: 'usd', kcal: 60, days_of_week: [1, 3, 5])
course3 = Course.create!(name: 'Swim Course', num_slot: 30, 
              cover_img: Rails.root.join('app/assets/images/yoga3.jpg').open, 
              phone_number: '1234567890', website: 'http://course3.com', 
              description: 'no description3', start_time: Time.now, 
              end_time: 3.hour.from_now, start_date: 40.days.from_now, teacher: teacher3, 
              station: station3, exercise: exercise3, studio: studio,
              tuition: 300.0, currency: 'usd', kcal: 80, days_of_week: [2, 4])
course4 = Course.create!(name: 'Soc Course', num_slot: 40, 
              cover_img: Rails.root.join('app/assets/images/yoga4.jpg').open, 
              phone_number: '1234567890', website: 'http://course4.com', 
              description: 'no description4', start_time: Time.now, 
              end_time: 4.hour.from_now, start_date: 50.days.from_now, teacher: teacher4, 
              station: station4, exercise: exercise4, studio: studio,
              tuition: 400.0, currency: 'usd', kcal: 100, days_of_week: [2])
course5 = Course.create!(name: 'Spring Yoga', num_slot: 10, 
              cover_img: Rails.root.join('app/assets/images/yoga5.jpg').open, 
              phone_number: '1234567890', website: 'http://course1.com', 
              description: 'no description1', start_time: Time.now, 
              end_time: 5.hour.from_now, start_date: 60.days.from_now, teacher: teacher5, 
              station: station5, exercise: exercise5, studio: studio,
              tuition: 500.0, currency: 'usd', kcal: 120, days_of_week: [2, 4, 6])
course6 = Course.create!(name: 'Summer Gym', num_slot: 20, 
              cover_img: Rails.root.join('app/assets/images/yoga6.jpg').open, 
              phone_number: '1234567890', website: 'http://course2.com', 
              description: 'no description2', start_time: Time.now, 
              end_time: 6.hour.from_now, start_date: 70.days.from_now, teacher: teacher6, 
              station: station6, exercise: exercise6, studio: studio,
              tuition: 600.0, currency: 'usd', kcal: 140, days_of_week: [3, 5])
course7 = Course.create!(name: 'Winter Soc', num_slot: 30, 
              cover_img: Rails.root.join('app/assets/images/yoga7.jpg').open, 
              phone_number: '1234567890', website: 'http://course3.com', 
              description: 'no description3', start_time: Time.now, 
              end_time: 7.hour.from_now, start_date: 35.days.from_now, teacher: teacher7, 
              station: station7, exercise: exercise7, studio: studio_goldenowl,
              tuition: 700.0, currency: 'usd', kcal: 160, days_of_week: [1])
course8 = Course.create!(name: 'City Yoga', num_slot: 40, 
              cover_img: Rails.root.join('app/assets/images/yoga8.jpg').open, 
              phone_number: '1234567890', website: 'http://course4.com', 
              description: 'no description4', start_time: Time.now, 
              end_time: 8.hour.from_now, start_date: 45.days.from_now, teacher: teacher8, 
              station: station8, exercise: exercise8, studio: studio_goldenowl,
              tuition: 800.0, currency: 'usd', kcal: 180, days_of_week: [2])
course9 = Course.create!(name: 'Oversea Doc', num_slot: 10, 
              cover_img: Rails.root.join('app/assets/images/yoga9.jpg').open, 
              phone_number: '1234567890', website: 'http://course1.com', 
              description: 'no description1', start_time: Time.now, 
              end_time: 9.hour.from_now, start_date: 55.days.from_now, teacher: teacher9, 
              station: station9, exercise: exercise9, studio: studio_goldenowl,
              tuition: 900.0, currency: 'usd', kcal: 200, days_of_week: [3, 7])
course10 = Course.create!(name: 'Demo Gym', num_slot: 20, 
              cover_img: Rails.root.join('app/assets/images/yoga10.jpg').open, 
              phone_number: '1234567890', website: 'http://course2.com', 
              description: 'no description2', start_time: Time.now, 
              end_time: 10.hour.from_now, start_date: 65.days.from_now, teacher: teacher10, 
              station: station10, exercise: exercise10, studio: studio_goldenowl,
              tuition: 150.0, currency: 'usd', kcal: 220, days_of_week: [4])
course11 = Course.create!(name: 'Pro Swim', num_slot: 30, 
              cover_img: Rails.root.join('app/assets/images/yoga11.jpg').open, 
              phone_number: '1234567890', website: 'http://course3.com', 
              description: 'no description3', start_time: Time.now, 
              end_time: 11.hour.from_now, start_date: 75.days.from_now, teacher: teacher11, 
              station: station11, exercise: exercise11, studio: studio_goldenowl,
              tuition: 160.0, currency: 'usd', kcal: 240, days_of_week: [5])
course12 = Course.create!(name: 'Basic Bad', num_slot: 40, 
              cover_img: Rails.root.join('app/assets/images/yoga12.jpg').open, 
              phone_number: '1234567890', website: 'http://course4.com', 
              description: 'no description4', start_time: Time.now, 
              end_time: 12.hour.from_now, start_date: 85.days.from_now, teacher: teacher12, 
              station: station12, exercise: exercise12, studio: studio_goldenowl,
              tuition: 170.0, currency: 'usd', kcal: 260, days_of_week: [1, 2, 3, 4, 5])

# customer_user.enrollments.create!(course_id: course1.id)
# customer_user.enrollments.create!(course_id: course2.id)
# customer_user.enrollments.create!(course_id: course3.id)
# customer_user.enrollments.create!(course_id: course4.id)