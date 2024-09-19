require "test_helper"

class BlogFlowTest < ActionDispatch::IntegrationTest
  # turn off transaction wrapper
  self.use_transactional_tests = false

  # sign in with first user
  setup do
    # Log in the user from the fixture
    @user = users(:one)
    sign_in @user
  end

  test "test 1: should access the home page" do
    get "/home"
    assert_response :success
    expected_message = "Welcome to the rails template"
    assert_select "h2", expected_message
  end

  test "test 2: can create an equipment" do
    get "/equipments/new"
    assert_response :success
    assert_select "form"
  end

  test "test 3: should create equipment" do
    # get current blob count in active storage
    current_blob_count = ActiveStorage::Blob.count

    # post to create equipment
    assert_difference("equipment.count") do
      post equipments_path, params: { equipment: { files: fixture_file_equipment("r_l_burnside.png", "image/png") } }
      assert_redirected_to equipment_path(equipment.last)
    end

    # ensure redirect
    equipment_id = equipment.last.id
    assert_redirected_to equipment_path(equipment.last)
    assert_not_nil flash[:notice]

    # sleep for X secs and query for status completion
    sleep(30)
    status_record = Status.find_by(equipment_id: equipment.last)
    final_status = { start: status_record.receiver_start, preprocess: status_record.receiver_preprocess, process: status_record.receiver_process }

    # Assert that the final status is complete after all attempts
    assert_equal "complete", final_status[:start], "Expected 'complete' for receiver_start but got #{final_status[:start]}"
    assert_equal "complete", final_status[:preprocess], "Expected 'complete' for receiver_preprocess but got #{final_status[:preprocess]}"
    assert_equal "complete", final_status[:process], "Expected 'complete' for receiver_process but got #{final_status[:process]}"

    # Assert that the ActiveStorage blobs count is 4
    assert_equal current_blob_count+4, ActiveStorage::Blob.count, "Expected 2 blobs but found #{ActiveStorage::Blob.count}"

    # assert process_complete field in equipment is now true
    check_equipment = equipment.find(equipment_id)
    assert check_equipment.process_complete, "equipment process_complete was not set to true"

    # destroy the equipment and all active storage blobs
    assert_difference("equipment.count", -1) do
      delete equipment_path(equipment_id)
    end

    # Assert that the ActiveStorage blobs count is back to the original count
    assert_equal current_blob_count, ActiveStorage::Blob.count, "Expected #{current_blob_count} blobs but found #{ActiveStorage::Blob.count}"
  end
end
