FactoryBot.define do
  factory :user do
    name { "hoge12" }
    email { |n| "hoge#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }

    trait :invalid do
      name nil
    end
  end

  factory :makoto, class: User do
    name { "Makoto" }
    email { "makoto@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end

  factory :yuuki, class: User do
    name { "Yuuki" }
    email  { "yuuki@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end