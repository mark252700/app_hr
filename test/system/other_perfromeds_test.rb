require "application_system_test_case"

class OtherPerfromedsTest < ApplicationSystemTestCase
  setup do
    @other_perfromed = other_perfromeds(:one)
  end

  test "visiting the index" do
    visit other_perfromeds_url
    assert_selector "h1", text: "Other perfromeds"
  end

  test "should create other perfromed" do
    visit other_perfromeds_url
    click_on "New other perfromed"

    check "Job current" if @other_perfromed.job_current
    fill_in "Job done", with: @other_perfromed.job_done
    fill_in "Job hr", with: @other_perfromed.job_hr
    fill_in "Job min", with: @other_perfromed.job_min
    fill_in "Job performed", with: @other_perfromed.job_performed
    fill_in "Job reason", with: @other_perfromed.job_reason
    click_on "Create Other perfromed"

    assert_text "Other perfromed was successfully created"
    click_on "Back"
  end

  test "should update Other perfromed" do
    visit other_perfromed_url(@other_perfromed)
    click_on "Edit this other perfromed", match: :first

    check "Job current" if @other_perfromed.job_current
    fill_in "Job done", with: @other_perfromed.job_done
    fill_in "Job hr", with: @other_perfromed.job_hr
    fill_in "Job min", with: @other_perfromed.job_min
    fill_in "Job performed", with: @other_perfromed.job_performed
    fill_in "Job reason", with: @other_perfromed.job_reason
    click_on "Update Other perfromed"

    assert_text "Other perfromed was successfully updated"
    click_on "Back"
  end

  test "should destroy Other perfromed" do
    visit other_perfromed_url(@other_perfromed)
    click_on "Destroy this other perfromed", match: :first

    assert_text "Other perfromed was successfully destroyed"
  end
end
