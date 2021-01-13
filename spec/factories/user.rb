FactoryBot.define do
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