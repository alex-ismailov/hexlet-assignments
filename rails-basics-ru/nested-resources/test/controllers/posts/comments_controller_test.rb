require "test_helper"

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @comment = post_comments(:one)

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

  test 'should get edit' do
    get edit_comment_url(@comment)
    assert_response :success
  end

  test "should update posts_comment" do
    patch post_comment_url(@comment), params: { post_comment: @attrs }
    assert_redirected_to post_url(@comment.post)
  end

  test "should destroy post_comment" do
    delete comment_url(@comment)

    assert { !PostComment.exists?(@comment.id)}

    assert_redirected_to post_url(@post)
  end
end
