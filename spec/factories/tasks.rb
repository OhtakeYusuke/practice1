FactoryBot.define do
  factory :tasks do
    name {Faker::Lorem.word}
    description {Faker::Lorem.paragraph}
    user
  end
end
