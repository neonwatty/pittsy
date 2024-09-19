require "application_system_test_case"

class AllequipmentsTest < ApplicationSystemTestCase
  fixtures :all

  setup do
    @user = users(:one)
    @equipment = equipments(:two)
  end

  test "test_1: non-logged in user functionality - all equipments" do
    visit equipments_path
    assert_selector "#navbar"
    assert_selector "#all-equipments-results"
  end

  test "test_2: check that equipment has files.attached" do
    assert @equipment.files.attached?, "equipment should have file attached via fixture"
  end

  test "test_3: check that details from equipment are accessible if not logged in" do
    visit equipments_path
    assert_selector "#navbar"
    assert_selector "#all-equipments-results"
    dynamic_id = "equipment_result_#{@equipment.id}"
    within "##{dynamic_id}" do
      click_on "Details"
    end
    assert_current_path new_user_session_path
  end


  test "test_4: check that details from equipment not accessible if logged in" do
    # visit
    visit equipments_path
    assert_selector "#navbar"
    assert_selector "#all-equipments-results"

    # sign in user and examine details card
    sign_in(@user)
    result_id = "equipment_result_#{@equipment.id}"
    within "##{result_id}" do
      click_on "Details"
    end

    # details card
    assert_current_path equipment_path(@equipment)
  end
end
