require "test_helper"

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bulletins_url
    assert_response :success
  end

  test "should get show page" do
    get bulletins_url(Bulletin.first)
    assert_response :success
  end
end
