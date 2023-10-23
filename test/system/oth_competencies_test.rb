require "application_system_test_case"

class OthCompetenciesTest < ApplicationSystemTestCase
  setup do
    @oth_competency = oth_competencies(:one)
  end

  test "visiting the index" do
    visit oth_competencies_url
    assert_selector "h1", text: "Oth competencies"
  end

  test "should create oth competency" do
    visit oth_competencies_url
    click_on "New oth competency"

    fill_in "Competency", with: @oth_competency.competency
    click_on "Create Oth competency"

    assert_text "Oth competency was successfully created"
    click_on "Back"
  end

  test "should update Oth competency" do
    visit oth_competency_url(@oth_competency)
    click_on "Edit this oth competency", match: :first

    fill_in "Competency", with: @oth_competency.competency
    click_on "Update Oth competency"

    assert_text "Oth competency was successfully updated"
    click_on "Back"
  end

  test "should destroy Oth competency" do
    visit oth_competency_url(@oth_competency)
    click_on "Destroy this oth competency", match: :first

    assert_text "Oth competency was successfully destroyed"
  end
end
