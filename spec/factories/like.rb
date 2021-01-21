FactoryBot.define do
  factory :like, class: Like do
    user = User.first
    post = Post.first
    user_id { user.id }
    post_id { post.id }
  end
end
