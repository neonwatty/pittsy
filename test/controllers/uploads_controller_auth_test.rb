require "test_helper"

class equipmentsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @valid_query_params = { query: "test query", source: "form" }
    @invalid_source_query_params = { query: "test query", source: "not-form" }
    @invalid_nosource_query_params = { query: "test query" }

    @user = users(:one)
    @equipment = equipments(:one)
    sign_in @user
  end

  test "test_1: index - equipments_controller_auth_test" do
    get equipments_path
    assert_response :success
  end

  test "test_2: new - equipments_controller_auth_test" do
    get new_equipment_path
    assert_response :success
  end

  test "test_3: show - equipments_controller_auth_test" do
    get equipment_path(@equipment)
    assert_response :success
  end

  test "test_4: create - equipments_controller_auth_test" do
    post equipments_path
    assert_response :bad_request
  end

  test "test_5: destroy - equipments_controller_auth_test" do
    delete equipment_path(@equipment)
    assert_redirected_to equipments_path
  end

  test "test_6: search - equipments_controller_auth_test" do
    get search_path
    assert_response :success
  end

  test "test_7: search_items success (:source==form provided)  - equipments_controller_auth_test" do
    post search_items_equipments_path, params: @valid_query_params, as: :turbo_stream
    assert_response :success
    assert_match /<turbo-stream/, @response.body
  end

  test "test_8: search_items failure (:source==not-form provided)  - equipments_controller_auth_test" do
    post search_items_equipments_path, params: @invalid_source_query_params, as: :turbo_stream
    assert_redirected_to root_path
  end

  test "test_9: search_items failure (:source not provided)  - equipments_controller_auth_test" do
    post search_items_equipments_path, params: @invalid_nosource_query_params, as: :turbo_stream
    assert_redirected_to root_path
  end
end
