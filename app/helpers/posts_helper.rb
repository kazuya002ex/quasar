# frozen_string_literal: true

module PostsHelper

  def post_genre(post)
    post.genres.present? ? post.genres[0].name : '未分類'
  end
end
