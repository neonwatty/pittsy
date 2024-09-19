require "test_helper"

class equipmentTest < ActiveSupport::TestCase
  # Load the fixtures
  fixtures :all

  test "check that equipment has file attached" do
      files = equipments(:one).files
      assert files.attached?
  end

  test "should not save equipment without files" do
    equipment = equipment.new(user: users(:one))
    saved = equipment.save
    assert_not saved, "Saved the equipment without files"
  end

  test "should associate equipment with user" do
    equipment = equipment.new(user: users(:one))
    equipment.files.attach(io: File.open(Rails.root.join("test/fixtures/files/mississippi_john_hurt.png")), filename: "mississippi_john_hurt.png")
    assert_equal users(:one), equipment.user, "equipment is not associated with the correct user"
  end

  test "should have attached files and filename" do
    equipment = equipment.new(user: users(:one))
    equipment.files.attach(io: File.open(Rails.root.join("test/fixtures/files/mississippi_john_hurt.png")), filename: "mississippi_john_hurt.png")
    assert equipment.files.attached?, "equipment should have files attached"
  end
end
