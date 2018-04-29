FactoryBot.define do
  factory :author do
    books { create_list :book, 3 }
    name { Faker::RuPaul.queen }
  end
end
