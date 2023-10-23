require "application_system_test_case"

class JbPerformedsTest < ApplicationSystemTestCase
  setup do
    @jb_performed = jb_performeds(:one)
  end

  test "visiting the index" do
    visit jb_performeds_url
    assert_selector "h1", text: "Jb performeds"
  end

  test "should create jb performed" do
    visit jb_performeds_url
    click_on "New jb performed"

    check "Job current" if @jb_performed.job_current
    fill_in "Job done", with: @jb_performed.job_done
    fill_in "Job hr", with: @jb_performed.job_hr
    fill_in "Job min", with: @jb_performed.job_min
    fill_in "Job performed", with: @jb_performed.job_performed
    fill_in "Job reason", with: @jb_performed.job_reason
    click_on "Create Jb performed"

    assert_text "Jb performed was successfully created"
    click_on "Back"
  end

  test "should update Jb performed" do
    visit jb_performed_url(@jb_performed)
    click_on "Edit this jb performed", match: :first

    check "Job current" if @jb_performed.job_current
    fill_in "Job done", with: @jb_performed.job_done
    fill_in "Job hr", with: @jb_performed.job_hr
    fill_in "Job min", with: @jb_performed.job_min
    fill_in "Job performed", with: @jb_performed.job_performed
    fill_in "Job reason", with: @jb_performed.job_reason
    click_on "Update Jb performed"

    assert_text "Jb performed was successfully updated"
    click_on "Back"
  end

  test "should destroy Jb performed" do
    visit jb_performed_url(@jb_performed)
    click_on "Destroy this jb performed", match: :first

    assert_text "Jb performed was successfully destroyed"
  end
end
