require "application_system_test_case"

class JbDescriptionsTest < ApplicationSystemTestCase
  setup do
    @jb_description = jb_descriptions(:one)
  end

  test "visiting the index" do
    visit jb_descriptions_url
    assert_selector "h1", text: "Jb descriptions"
  end

  test "should create jb description" do
    visit jb_descriptions_url
    click_on "New jb description"

    fill_in "Description", with: @jb_description.description
    click_on "Create Jb description"

    assert_text "Jb description was successfully created"
    click_on "Back"
  end

  test "should update Jb description" do
    visit jb_description_url(@jb_description)
    click_on "Edit this jb description", match: :first

    fill_in "Description", with: @jb_description.description
    click_on "Update Jb description"

    assert_text "Jb description was successfully updated"
    click_on "Back"
  end

  test "should destroy Jb description" do
    visit jb_description_url(@jb_description)
    click_on "Destroy this jb description", match: :first

    assert_text "Jb description was successfully destroyed"
  end
end
