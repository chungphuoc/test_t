user = User.create!(email: "studio@tone.com", name: "Studio", password: "12345678", password_confirmation: "12345678")
Studio.create(user_id: user.id, )
