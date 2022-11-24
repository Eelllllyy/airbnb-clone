# frozen_string_literal: true

FILE_NAMES_1 = %w[stay_1 stay_2 stay_3 stay_4 stay_5].freeze
FILE_NAMES_2 = %w[experience_1 experience_2 experience_3].freeze

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
    location: 'Кйптаун, ЮАР',
    date_from: Time.zone.today,
    date_to: Time.zone.today + 1.month,
    price: '700$',
    host: user,
    rating: 4
  )
  next unless FILE_NAMES_1.all? { File.exist?("tmp/photos/#{_1}.jpeg") }

  stay.photos.attach(
    FILE_NAMES_1.map do |name|
      { io: File.open("tmp/photos/#{name}.jpeg"), filename: "#{name}.jpeg", content_type: 'image/jpeg' }
    end
  )
end

Experience.destroy_all

exp1 = Experience.create(
  name: 'Saint Petersburg trip',
  rating: 5,
  price: 'for free',
  host: user
)
if File.exist?('tmp/photos/video_1.mp4')
  exp1.video.attach(
    { io: File.open('tmp/photos/video_1.mp4'), filename: 'video_1.mp4', content_type: 'video/mp4' }
  )
end
if File.exist?('tmp/photos/photo_1.mp4')
  exp1.photos.attach(
    { io: File.open('tmp/photos/photo_1.jpeg'), filename: 'photo_1.jpeg', content_type: 'image/jpeg' }
  )
end


40.times do |n|
  exp = Experience.create(
    name: 'Super party',
    rating: 5,
    price: '100$',
    host: user
  )
  next unless FILE_NAMES_2.all? { File.exist?("tmp/photos/#{_1}.jpeg") }

  exp.photos.attach(
    FILE_NAMES_2.map do |name|
      { io: File.open("tmp/photos/#{name}.jpeg"), filename: "#{name}.jpeg", content_type: 'image/jpeg' }
    end
  )
end
