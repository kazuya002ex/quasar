FactoryBot.define do
  factory :post do
    title { "たのしい話" }
    story { "この物語の説明ぶん" }
    order { "こうして欲しい" }

    trait :invalid do
      title { nil }
      story { nil }
      order { nil }
    end
  end
end
