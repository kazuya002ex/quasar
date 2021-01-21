FactoryBot.define do
  factory :micropost do
    content { "たのしい文章です" }
    user_id { 1 }
    post_id { 1 }
    association :post

    trait :invalid do
      content { nil }
      user_id { 1 }
      post_id { 1 }
    end
  end

  %w(micropost1_1 micropost1_2 micropost2_1).each do |micropost|
    factory micropost.to_sym, class: Micropost do
      content { '文章文章is文章' }
    end
  end
end