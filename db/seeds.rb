puts ('delete all model...')
Enrollment.delete_all
Course.delete_all
Station.delete_all
Teacher.delete_all
Exercise.delete_all
Customer.delete_all
Studio.delete_all
User.delete_all
PayableOption.delete_all

puts ('create Admin account...')
admin = Admin.create!
puts ('create Studio accounts...')
studio = Studio.create!(website: 'http://studio.com', facility: [],
                        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur')
studio_goldenowl = Studio.create!(website: 'http://studio.com', facility: [],
                                  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur')
puts ('create Customer accounts...')
customer = Customer.create!
customer_toan = Customer.create!

puts ('create User base on admin, studio and customer...')
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

puts ('create Stations...')
station1 = Station.new(location: 'district 10, Ho Chi Minh City', latitude: 35.6471564, longitude: 139.7075507)
station1.translations.build(locale: 'en', name: 'Ebisu')
station1.translations.build(locale: 'ja', name: '恵比寿')
station1.save!
station2 = Station.new(location: 'district 5, Ha Noi', latitude: 35.6581003, longitude: 139.699553)
station2.translations.build(locale: 'en', name: 'Shibuya')
station2.translations.build(locale: 'ja', name: '渋谷')
station2.save!
station3 = Station.new(location: 'Da Nang City', latitude: 35.650629, longitude: 139.6823913)
station3.translations.build(locale: 'en', name: 'Ikejiri-Ohashi')
station3.translations.build(locale: 'ja', name: '池尻大橋')
station3.save!
station4 = Station.new(location: 'Hoi An', latitude: 35.6641866, longitude: 139.7290538)
station4.translations.build(locale: 'en', name: 'Roppongi')
station4.translations.build(locale: 'ja', name: '六本木')
station4.save!
station5 = Station.new(location: '356, Buon Me Thuot', latitude: 35.6703994, longitude: 139.7005262)
station5.translations.build(locale: 'en', name: 'Harajyuku')
station5.translations.build(locale: 'ja', name: '原宿')
station5.save!
station6 = Station.new(location: '256, Ly Thuong Kiet, Daklak', latitude: 35.6652511, longitude: 139.7099034)
station6.translations.build(locale: 'en', name: 'Omotesando')
station6.translations.build(locale: 'ja', name: '表参道')
station6.save!
station7 = Station.new(location: 'Ben Tre', latitude: 35.651519, longitude: 139.7199713)
station7.translations.build(locale: 'en', name: 'Hiroo')
station7.translations.build(locale: 'ja', name: '広尾')
station7.save!
station8 = Station.new(location: 'district 5, Binh Thuan', latitude: 35.66649, longitude: 139.7240533)
station8.translations.build(locale: 'en', name: 'Nogizaka')
station8.translations.build(locale: 'ja', name: '乃木坂')
station8.save!
station9 = Station.new(location: 'district 14, Da Nang City', latitude: 35.656297, longitude: 139.7349423)
station9.translations.build(locale: 'en', name: 'Azabu-Jyuban')
station9.translations.build(locale: 'ja', name: '麻布十番')
station9.save!
station10 = Station.new(location: '987, Hoi An', latitude: 35.672212, longitude: 139.7341913)
station10.translations.build(locale: 'en', name: 'Akasaka')
station10.translations.build(locale: 'ja', name: '赤坂')
station10.save!
station11 = Station.new(location: 'ward 9, district 5, Buon Me Thuot', latitude: 35.676795, longitude: 139.7350803)
station11.translations.build(locale: 'en', name: 'Akasaka-Mitsuke')
station11.translations.build(locale: 'ja', name: '赤坂見附')
station11.save!
station12 = Station.new(location: '369, Dinh Tien Hoan street, Ha Noi', latitude: 35.670399, longitude: 139.7156372)
station12.translations.build(locale: 'en', name: 'Gaienmae')
station12.translations.build(locale: 'ja', name: '外苑前')
station12.save!

station13 = Station.new(location: '321, Nguyen Hue street, Can Tho', latitude: 35.6728489, longitude: 139.7215241)
station13.translations.build(locale: 'en', name: 'Aoyama-Ichome')
station13.translations.build(locale: 'ja', name: '青山一丁目')
station13.save!

station14 = Station.new(location: '654, Quang Trung street, Ho Chi Minh', latitude: 35.6714054, longitude: 139.7631668)
station14.translations.build(locale: 'en', name: 'Ginza')
station14.translations.build(locale: 'ja', name: '銀座')
station14.save!

station15 = Station.new(location: '984, Le Dai Hanh street, Ben Tre', latitude: 35.681298, longitude: 139.7640582)
station15.translations.build(locale: 'en', name: 'Tokyo')
station15.translations.build(locale: 'ja', name: '東京')
station15.save!

station16 = Station.new(location: '345, Phan Boi Chau street, Ha Noi', latitude: 35.6749424, longitude: 139.7607056)
station16.translations.build(locale: 'en', name: 'Yuraku-Cho')
station16.translations.build(locale: 'ja', name: '有楽町')
station16.save!

station17 = Station.new(location: '256, Ly Thai To street, Hai Phong', latitude: 35.6652511, longitude: 139.7099034)
station17.translations.build(locale: 'en', name: 'Ootemachi')
station17.translations.build(locale: 'ja', name: '表参道')
station17.save!

station18 = Station.new(location: '497, Lang Cha Ca street, Ho Chi Minh', latitude: 35.690553, longitude: 139.6973901)
station18.translations.build(locale: 'en', name: 'Shinjiku')
station18.translations.build(locale: 'ja', name: '新宿')
station18.save!

station19 = Station.new(location: '256, Hoang Sa Truong Sa street, Ha Noi', latitude: 35.68857, longitude: 139.7086653)
station19.translations.build(locale: 'en', name: 'Shinjuku-Gyoen')
station19.translations.build(locale: 'ja', name: '新宿御苑')
station19.save!

station20 = Station.new(location: '84, Vo Thi Sau street, Ha Noi', latitude: 35.633998, longitude: 139.7136393)
station20.translations.build(locale: 'en', name: 'Meguro')
station20.translations.build(locale: 'ja', name: '目黒')
station20.save!

station21 = Station.new(location: '82, Dien Bien Phu street, Ho Chi Minh', latitude: 35.6480919, longitude: 139.7009593)
station21.translations.build(locale: 'en', name: 'Daikanyama')
station21.translations.build(locale: 'ja', name: '代官山')
station21.save!

station22 = Station.new(location: '098, Nguyen Trai street, Ho Chi Minh', latitude: 35.6442877, longitude: 139.6969069)
station22.translations.build(locale: 'en', name: 'Nakameguro')
station22.translations.build(locale: 'ja', name: '中目黒')
station22.save!

station23 = Station.new(location: '821, Nguyen Du street, Ho Chi Minh', latitude: 35.703819, longitude: 139.7323293)
station23.translations.build(locale: 'en', name: 'Kagurazaka')
station23.translations.build(locale: 'ja', name: '神楽坂')
station23.save!

station24 = Station.new(location: '39, Pham Ngu Lao street, Ho Chi Minh', latitude: 35.7020235, longitude: 139.7428992)
station24.translations.build(locale: 'en', name: 'Iidabashi')
station24.translations.build(locale: 'ja', name: '飯田橋')
station24.save!

station25 = Station.new(location: '264, Nguyen Tri Phuong street, Ho Chi Minh', latitude: 35.6480611, longitude: 139.7463811)
station25.translations.build(locale: 'en', name: 'Mita')
station25.translations.build(locale: 'ja', name: '三田')
station25.save!

station26 = Station.new(location: '26, Hong Bang street, Ho Chi Minh', latitude: 35.6457976, longitude: 139.7454678)
station26.translations.build(locale: 'en', name: 'Tamachi')
station26.translations.build(locale: 'ja', name: '田町')
station26.save!

station27 = Station.new(location: '976, Vo Van Tan street, Ho Chi Minh', latitude: 35.6284713, longitude: 139.736571)
station27.translations.build(locale: 'en', name: 'Shinagawa')
station27.translations.build(locale: 'ja', name: '品川')
station27.save!

# station1 = Station.create!(name: 'Parkson', location: 'district 10, Ho Chi Minh City', latitude: 10.762622, longitude: 106.660172)
# station2 = Station.create!(name: 'Lotteria', location: 'district 5, Ha Noi', latitude: 10.762622, longitude: 106.660172)
# station3 = Station.create!(name: 'Diamon', location: 'Da Nang City', latitude: 10.762622, longitude: 106.660172)
# station4 = Station.create!(name: 'Gold', location: 'Hoi An', latitude: 10.762622, longitude: 106.660172)
# station5 = Station.create!(name: 'KFC', location: '356, Buon Me Thuot', latitude: 10.762622, longitude: 106.660172)
# station6 = Station.create!(name: 'New World', location: '256, Ly Thuong Kiet, Daklak', latitude: 10.762622, longitude: 106.660172)
# station7 = Station.create!(name: 'Waseco', location: 'Ben Tre', latitude: 10.762622, longitude: 106.660172)
# station8 = Station.create!(name: 'Marid', location: 'district 5, Binh Thuan', latitude: 10.762622, longitude: 106.660172)
# station9 = Station.create!(name: 'Chelsea', location: 'district 14, Da Nang City', latitude: 10.762622, longitude: 106.660172)
# station10 = Station.create!(name: 'Arsenal', location: '987, Hoi An', latitude: 10.762622, longitude: 106.660172)
# station11 = Station.create!(name: 'Caravelle', location: 'ward 9, district 5, Buon Me Thuot', latitude: 10.762622, longitude: 106.660172)
# station12 = Station.create!(name: 'Majestic', location: '256, Ly Thuong Kiet street, Dak Nong', latitude: 10.762622, longitude: 106.660172)

puts ('create Teachers...')
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

puts ('create Exercises...')
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

puts ('create Contracts...')
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

puts ('create Branchs...')
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

puts ('create Services...')
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

puts ('create Courses...')
course1 = Course.create!(name: 'Yoga Course', num_slot: 10,
              cover_img: Rails.root.join('app/assets/images/yoga1.jpg').open,
              phone_number: '1234567890', website: 'http://course1.com',
              description: 'no description1', start_time: Time.now,
              end_time: 1.hour.from_now, start_date:  20.days.from_now, teacher: teacher1,
              station: station1, exercise: exercise1, studio: studio,
              tuition: 100.0, currency: 'JPY', kcal: 40, days_of_week: [1])
course2 = Course.create!(name: 'Gym Course', num_slot: 20,
              cover_img: Rails.root.join('app/assets/images/yoga2.jpg').open,
              phone_number: '1234567890', website: 'http://course2.com',
              description: 'no description2', start_time: Time.now,
              end_time: 2.hour.from_now, start_date: 30.days.from_now, teacher: teacher2,
              station: station2, exercise: exercise2, studio: studio,
              tuition: 200.0, currency: 'JPY', kcal: 60, days_of_week: [1, 3, 5])
course3 = Course.create!(name: 'Swim Course', num_slot: 30,
              cover_img: Rails.root.join('app/assets/images/yoga3.jpg').open,
              phone_number: '1234567890', website: 'http://course3.com',
              description: 'no description3', start_time: Time.now,
              end_time: 3.hour.from_now, start_date: 40.days.from_now, teacher: teacher3,
              station: station3, exercise: exercise3, studio: studio,
              tuition: 300.0, currency: 'JPY', kcal: 80, days_of_week: [2, 4])
course4 = Course.create!(name: 'Soc Course', num_slot: 40,
              cover_img: Rails.root.join('app/assets/images/yoga4.jpg').open,
              phone_number: '1234567890', website: 'http://course4.com',
              description: 'no description4', start_time: Time.now,
              end_time: 4.hour.from_now, start_date: 50.days.from_now, teacher: teacher4,
              station: station4, exercise: exercise4, studio: studio,
              tuition: 400.0, currency: 'JPY', kcal: 100, days_of_week: [2])
course5 = Course.create!(name: 'Spring Yoga', num_slot: 10,
              cover_img: Rails.root.join('app/assets/images/yoga5.jpg').open,
              phone_number: '1234567890', website: 'http://course1.com',
              description: 'no description1', start_time: Time.now,
              end_time: 5.hour.from_now, start_date: 60.days.from_now, teacher: teacher5,
              station: station5, exercise: exercise5, studio: studio,
              tuition: 500.0, currency: 'JPY', kcal: 120, days_of_week: [2, 4, 6])
course6 = Course.create!(name: 'Summer Gym', num_slot: 20,
              cover_img: Rails.root.join('app/assets/images/yoga6.jpg').open,
              phone_number: '1234567890', website: 'http://course2.com',
              description: 'no description2', start_time: Time.now,
              end_time: 6.hour.from_now, start_date: 70.days.from_now, teacher: teacher6,
              station: station6, exercise: exercise6, studio: studio,
              tuition: 600.0, currency: 'JPY', kcal: 140, days_of_week: [3, 5])
course7 = Course.create!(name: 'Winter Soc', num_slot: 30,
              cover_img: Rails.root.join('app/assets/images/yoga7.jpg').open,
              phone_number: '1234567890', website: 'http://course3.com',
              description: 'no description3', start_time: Time.now,
              end_time: 7.hour.from_now, start_date: 35.days.from_now, teacher: teacher7,
              station: station7, exercise: exercise7, studio: studio_goldenowl,
              tuition: 700.0, currency: 'JPY', kcal: 160, days_of_week: [1])
course8 = Course.create!(name: 'City Yoga', num_slot: 40,
              cover_img: Rails.root.join('app/assets/images/yoga8.jpg').open,
              phone_number: '1234567890', website: 'http://course4.com',
              description: 'no description4', start_time: Time.now,
              end_time: 8.hour.from_now, start_date: 45.days.from_now, teacher: teacher8,
              station: station8, exercise: exercise8, studio: studio_goldenowl,
              tuition: 800.0, currency: 'JPY', kcal: 180, days_of_week: [2])
course9 = Course.create!(name: 'Oversea Doc', num_slot: 10,
              cover_img: Rails.root.join('app/assets/images/yoga9.jpg').open,
              phone_number: '1234567890', website: 'http://course1.com',
              description: 'no description1', start_time: Time.now,
              end_time: 9.hour.from_now, start_date: 55.days.from_now, teacher: teacher9,
              station: station9, exercise: exercise9, studio: studio_goldenowl,
              tuition: 900.0, currency: 'JPY', kcal: 200, days_of_week: [3, 7])
course10 = Course.create!(name: 'Demo Gym', num_slot: 20,
              cover_img: Rails.root.join('app/assets/images/yoga10.jpg').open,
              phone_number: '1234567890', website: 'http://course2.com',
              description: 'no description2', start_time: Time.now,
              end_time: 10.hour.from_now, start_date: 65.days.from_now, teacher: teacher10,
              station: station10, exercise: exercise10, studio: studio_goldenowl,
              tuition: 150.0, currency: 'JPY', kcal: 220, days_of_week: [4])
course11 = Course.create!(name: 'Pro Swim', num_slot: 30,
              cover_img: Rails.root.join('app/assets/images/yoga11.jpg').open,
              phone_number: '1234567890', website: 'http://course3.com',
              description: 'no description3', start_time: Time.now,
              end_time: 11.hour.from_now, start_date: 75.days.from_now, teacher: teacher11,
              station: station11, exercise: exercise11, studio: studio_goldenowl,
              tuition: 160.0, currency: 'JPY', kcal: 240, days_of_week: [5])
course12 = Course.create!(name: 'Basic Bad', num_slot: 40,
              cover_img: Rails.root.join('app/assets/images/yoga12.jpg').open,
              phone_number: '1234567890', website: 'http://course4.com',
              description: 'no description4', start_time: Time.now,
              end_time: 12.hour.from_now, start_date: 85.days.from_now, teacher: teacher12,
              station: station12, exercise: exercise12, studio: studio_goldenowl,
              tuition: 170.0, currency: 'JPY', kcal: 260, days_of_week: [1, 2, 3, 4, 5])

# customer_user.enrollments.create!(course_id: course1.id)
# customer_user.enrollments.create!(course_id: course2.id)
# customer_user.enrollments.create!(course_id: course3.id)
# customer_user.enrollments.create!(course_id: course4.id)
Category.create_default

puts 'create BackgroundImages....'
BackgroundImage.create_homepage

