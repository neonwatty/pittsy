require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  def setup
    @users = user(:one)
  end

  test "test_1: should get home" do
    get root_path
    assert_response :success
  end
end
