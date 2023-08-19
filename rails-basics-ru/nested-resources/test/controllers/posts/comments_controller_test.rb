require "test_helper"

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @posts_comment = post_comments(:one)

    @attrs = {
      body: Faker::ChuckNorris.fact
    }
  end

  test "should get new" do
    get new_post_comment_url(@post)
    assert_response :success
  end

  test "should create posts_comment" do
    post post_comments_url(@post), params: { post_comment: @attrs }

    comment = PostComment.find_by @attrs

    assert { comment }
    assert_redirected_to post_url(comment.post)
  end

  # test "should show posts_comment" do
  #   get posts_comment_url(@posts_comment)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_posts_comment_url(@posts_comment)
  #   assert_response :success
  # end

  # test "should update posts_comment" do
  #   patch posts_comment_url(@posts_comment), params: { posts_comment: {  } }
  #   assert_redirected_to posts_comment_url(@posts_comment)
  # end

  # test "should destroy posts_comment" do
  #   assert_difference("Posts::Comment.count", -1) do
  #     delete posts_comment_url(@posts_comment)
  #   end

  #   assert_redirected_to posts_comments_url
  # end
end
