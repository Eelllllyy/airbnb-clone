# frozen_string_literal: true

FILE_NAMES = %w[stay_1 stay_2 stay_3 stay_4 stay_5].freeze

User.destroy_all
user = User.create(
  name: 'Jenny',
  email: 'jenny@gmail.com',
  password: 'test'
)
user.avatar.attach(io: File.open('tmp/photos/profile.jpeg'), filename: 'profile.jpg', content_type: 'image/jpeg')

Stay.destroy_all
40.times do |n|
  stay = Stay.create(
    name: "Hidden Haven - 5 Bed Villa with pool & Sea Views (#{n})",
    location: 'Кейптаун, ЮАР',
    date_from: Time.zone.today,
    date_to: Time.zone.today + 1.month,
    price: '700$',
    host: user,
    rating: 4
  )
  next unless FILE_NAMES.all? { File.exist?("tmp/photos/#{_1}.jpeg") }

  stay.photos.attach(
    FILE_NAMES.map do |name|
      { io: File.open("tmp/photos/#{name}.jpeg"), filename: "#{name}.jpeg", content_type: 'image/jpeg' }
    end
  )
end
