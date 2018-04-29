FactoryBot.define do
  factory :book do
    format { Format.count === 0 ? build( :format ) : Format.all.sample }

    title { "#{ Faker::RuPaul.quote } #{ Digest::SHA256.hexdigest( SecureRandom.random_bytes )[ 0...7 ] }"}
    release { Time.now }
    price { 10.00 }
  end
end
