# User Create
p 'User create 1~10'
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
p 'Post create 1~20'
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
    title: "タイトル#{n + 11}",
    story: "タイトル#{n + 11}のストーリー説明 \n ストーリーの説明その1 \n ストーリーの説明その2",
    order: "素敵なストーリーにしてください。",
    user_id: 2
    )
end

# Micropost Create
p 'Micropost create 1~10'
10.times do |n|
  Micropost.create!(
    content: "シナリオ#{n + 1}",
    post_id: "#{n + 1}",
    user_id: "#{n + 1}"
  )
end
