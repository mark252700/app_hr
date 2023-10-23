require "application_system_test_case"

class OtherCompetenciesTest < ApplicationSystemTestCase
  setup do
    @other_competency = other_competencies(:one)
  end

  test "visiting the index" do
    visit other_competencies_url
    assert_selector "h1", text: "Other competencies"
  end

  test "should create other competency" do
    visit other_competencies_url
    click_on "New other competency"

    fill_in "Competencies", with: @other_competency.competencies
    click_on "Create Other competency"

    assert_text "Other competency was successfully created"
    click_on "Back"
  end

  test "should update Other competency" do
    visit other_competency_url(@other_competency)
    click_on "Edit this other competency", match: :first

    fill_in "Competencies", with: @other_competency.competencies
    click_on "Update Other competency"

    assert_text "Other competency was successfully updated"
    click_on "Back"
  end

  test "should destroy Other competency" do
    visit other_competency_url(@other_competency)
    click_on "Destroy this other competency", match: :first

    assert_text "Other competency was successfully destroyed"
  end
end
