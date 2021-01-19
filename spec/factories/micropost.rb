FactoryBot.define do
  factory :micropost do
    content { "たのしい文章です" }

    trait :invalid do
      content { nil }
    end
  end
end