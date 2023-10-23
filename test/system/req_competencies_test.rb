require "application_system_test_case"

class ReqCompetenciesTest < ApplicationSystemTestCase
  setup do
    @req_competency = req_competencies(:one)
  end

  test "visiting the index" do
    visit req_competencies_url
    assert_selector "h1", text: "Req competencies"
  end

  test "should create req competency" do
    visit req_competencies_url
    click_on "New req competency"

    fill_in "Competencies", with: @req_competency.competencies
    click_on "Create Req competency"

    assert_text "Req competency was successfully created"
    click_on "Back"
  end

  test "should update Req competency" do
    visit req_competency_url(@req_competency)
    click_on "Edit this req competency", match: :first

    fill_in "Competencies", with: @req_competency.competencies
    click_on "Update Req competency"

    assert_text "Req competency was successfully updated"
    click_on "Back"
  end

  test "should destroy Req competency" do
    visit req_competency_url(@req_competency)
    click_on "Destroy this req competency", match: :first

    assert_text "Req competency was successfully destroyed"
  end
end
