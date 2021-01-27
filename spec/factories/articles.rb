FactoryBot.define do
  factory :article do
    title { "たのしいニュース" }
    content { "このニュースの説明ぶん" }
    user_id { 1 }

    trait :invalid do
      title { nil }
      content { nil }
      user_id { nil }
    end
  end
end
