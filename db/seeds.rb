# frozen_string_literal: true

User.destroy_all
user = User.create(
  name: 'Jenny',
  email: 'jenny@gmail.com',
  password: 'test'
)
user.avatar.attach(io: File.open('tmp/photos/profile.jpeg'), filename: 'profile.jpg', content_type: 'image/jpeg')

Stay.destroy_all
stay = Stay.create(
  name: 'Hidden Haven - 5 Bed Villa with pool & Sea Views',
  location: 'Кйптаун, ЮАР',
  date_from: Time.zone.today,
  date_to: Time.zone.today + 1.month,
  price: '700$',
  host: user,
  rating: 4
)
stay.photos.attach(
  [
    { io: File.open('tmp/photos/stay_1.jpeg'), filename: 'stay_1.jpg', content_type: 'image/jpeg' },
    { io: File.open('tmp/photos/stay_2.jpeg'), filename: 'stay_2.jpg', content_type: 'image/jpeg' },
    { io: File.open('tmp/photos/stay_3.jpeg'), filename: 'stay_3.jpg', content_type: 'image/jpeg' },
    { io: File.open('tmp/photos/stay_4.jpeg'), filename: 'stay_4.jpg', content_type: 'image/jpeg' },
    { io: File.open('tmp/photos/stay_5.jpeg'), filename: 'stay_5.jpg', content_type: 'image/jpeg' }
  ]
)
