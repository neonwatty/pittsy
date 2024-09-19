require "application_system_test_case"

class HomeTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "test_1: nav links show to non-logged in user - home page" do
    visit root_url
    assert_selector "#navbar"
    assert_link "Home", href: root_path
    assert_link "Search", href: search_path
    assert_link "All equipments", href: equipments_path
    assert_link "New equipment", href: new_equipment_path
    assert_link "Log in", href: new_user_session_path
    assert_link "Sign up", href: new_user_registration_path
    assert_no_selector "button", text: "Log out"
    assert_no_link "Profile", href: edit_user_registration_path
  end

  test "test_2: nav links show to logged in user - home page" do
    sign_in @user
    visit root_url
    assert_selector "#navbar"
    assert_link "Home", href: root_path
    assert_link "Search", href: search_path
    assert_link "All equipments", href: equipments_path
    assert_link "New equipment", href: new_equipment_path
    assert_no_link "Log in", href: new_user_session_path
    assert_no_link "Sign up", href: new_user_registration_path
    assert_selector "button", text: "Log out"
    assert_link "Profile", href: edit_user_registration_path
  end

  test "test_3: user is redirected from 'New equipment' to 'Sign in' when not signed in" do
    visit new_equipment_path
    assert_current_path new_user_session_path
  end

  test "test_4: user successfully goes to 'New equipment' when signed in" do
    sign_in @user
    visit new_equipment_path
    assert_current_path new_equipment_path
  end
end
