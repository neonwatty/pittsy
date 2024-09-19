require "test_helper"

class equipmentsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @equipment = equipments(:one)
  end

  test "test_1: should get home" do
    get root_path
    assert_response :success
  end
end
