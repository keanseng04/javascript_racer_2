require 'faker'
require 'securerandom'

20.times do
  Player.create(name: Faker::Internet.user_name, url: SecureRandom.hex(3))
end