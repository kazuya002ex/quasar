# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User Create
10.times do |n|
  User.create!(
    name: "hara#{n + 1}",
    email: "aaaa#{n + 1}@gmail.comm",
    password: "password",
    password_confirmation: "password",
    profile: "初めまして、hara#{n + 1}です"
  )
end


# Post Create
10.times do |n|
  Post.create!(
    title: "タイトル#{n + 1}",
    story: "タイトル#{n + 1}のストーリー説明 \n ストーリーの説明その1 \n ストーリーの説明その2",
    order: "素敵なストーリーにしてください。",
    user_id: 1
  )
end

10.times do |n|
  Post.create!(
    title: "タイトル#{n + 1}",
    story: "タイトル#{n + 1}のストーリー説明 \n ストーリーの説明その1 \n ストーリーの説明その2",
    order: "素敵なストーリーにしてください。",
    user_id: 2
    )
end