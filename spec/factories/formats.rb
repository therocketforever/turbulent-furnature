FactoryBot.define do
  factory :format do
    name { [ 0, 1, 2 ].sample }

  trait :hardcover do
    name 0
  end

  trait :softcover do
    name 1
  end

  trait :digital do
   name 2
  end

  end
end
