require "application_system_test_case"

class OtherCompetencesTest < ApplicationSystemTestCase
  setup do
    @other_competence = other_competences(:one)
  end

  test "visiting the index" do
    visit other_competences_url
    assert_selector "h1", text: "Other competences"
  end

  test "should create other competence" do
    visit other_competences_url
    click_on "New other competence"

    fill_in "Competencies", with: @other_competence.competencies
    click_on "Create Other competence"

    assert_text "Other competence was successfully created"
    click_on "Back"
  end

  test "should update Other competence" do
    visit other_competence_url(@other_competence)
    click_on "Edit this other competence", match: :first

    fill_in "Competencies", with: @other_competence.competencies
    click_on "Update Other competence"

    assert_text "Other competence was successfully updated"
    click_on "Back"
  end

  test "should destroy Other competence" do
    visit other_competence_url(@other_competence)
    click_on "Destroy this other competence", match: :first

    assert_text "Other competence was successfully destroyed"
  end
end
