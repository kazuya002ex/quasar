require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
  	@post = Post.new(title: "今日の買い物", story: "買い物に出かけた時のお話", order: "八百屋で買い物をする内容にしてください")
  end

  test "should be valid" do
  	assert @post.valid?
  end

  test "title should be present" do 
  	@post.title = "     "
    assert_not @post.valid?
  end

  test "story should be present" do 
  	@post.story = "     "
    assert_not @post.valid?
  end

  test "order should be present" do 
  	@post.order = "     "
    assert_not @post.valid?
  end

  test "title should not be too long" do 
  	@post.title = "a" * 56
  	assert_not @post.valid?
  end

  test "story should not be too long" do 
  	@post.story = "a" * 301
  	assert_not @post.valid?
  end

  test "order should not be too long" do
  	@post.order = "a" * 301
  	assert_not @post.valid?
  end
end
