require "application_system_test_case"

class NestedOthperformedsTest < ApplicationSystemTestCase
  setup do
    @nested_othperformed = nested_othperformeds(:one)
  end

  test "visiting the index" do
    visit nested_othperformeds_url
    assert_selector "h1", text: "Nested othperformeds"
  end

  test "should create nested othperformed" do
    visit nested_othperformeds_url
    click_on "New nested othperformed"

    check "Job current" if @nested_othperformed.job_current
    fill_in "Job done", with: @nested_othperformed.job_done
    fill_in "Job hr", with: @nested_othperformed.job_hr
    fill_in "Job min", with: @nested_othperformed.job_min
    fill_in "Job performed", with: @nested_othperformed.job_performed
    fill_in "Job reason", with: @nested_othperformed.job_reason
    click_on "Create Nested othperformed"

    assert_text "Nested othperformed was successfully created"
    click_on "Back"
  end

  test "should update Nested othperformed" do
    visit nested_othperformed_url(@nested_othperformed)
    click_on "Edit this nested othperformed", match: :first

    check "Job current" if @nested_othperformed.job_current
    fill_in "Job done", with: @nested_othperformed.job_done
    fill_in "Job hr", with: @nested_othperformed.job_hr
    fill_in "Job min", with: @nested_othperformed.job_min
    fill_in "Job performed", with: @nested_othperformed.job_performed
    fill_in "Job reason", with: @nested_othperformed.job_reason
    click_on "Update Nested othperformed"

    assert_text "Nested othperformed was successfully updated"
    click_on "Back"
  end

  test "should destroy Nested othperformed" do
    visit nested_othperformed_url(@nested_othperformed)
    click_on "Destroy this nested othperformed", match: :first

    assert_text "Nested othperformed was successfully destroyed"
  end
end
