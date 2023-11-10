require "application_system_test_case"

class NestedDescriptionsTest < ApplicationSystemTestCase
  setup do
    @nested_description = nested_descriptions(:one)
  end

  test "visiting the index" do
    visit nested_descriptions_url
    assert_selector "h1", text: "Nested descriptions"
  end

  test "should create nested description" do
    visit nested_descriptions_url
    click_on "New nested description"

    fill_in "Description", with: @nested_description.description
    click_on "Create Nested description"

    assert_text "Nested description was successfully created"
    click_on "Back"
  end

  test "should update Nested description" do
    visit nested_description_url(@nested_description)
    click_on "Edit this nested description", match: :first

    fill_in "Description", with: @nested_description.description
    click_on "Update Nested description"

    assert_text "Nested description was successfully updated"
    click_on "Back"
  end

  test "should destroy Nested description" do
    visit nested_description_url(@nested_description)
    click_on "Destroy this nested description", match: :first

    assert_text "Nested description was successfully destroyed"
  end
end
