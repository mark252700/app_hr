require "application_system_test_case"

class OthPerformedsTest < ApplicationSystemTestCase
  setup do
    @oth_performed = oth_performeds(:one)
  end

  test "visiting the index" do
    visit oth_performeds_url
    assert_selector "h1", text: "Oth performeds"
  end

  test "should create oth performed" do
    visit oth_performeds_url
    click_on "New oth performed"

    fill_in "Integer", with: @oth_performed.integer
    check "Job current" if @oth_performed.job_current
    fill_in "Job done", with: @oth_performed.job_done
    fill_in "Job hr", with: @oth_performed.job_hr
    fill_in "Job min", with: @oth_performed.job_min
    fill_in "Job performed", with: @oth_performed.job_performed
    fill_in "Job reason", with: @oth_performed.job_reason
    click_on "Create Oth performed"

    assert_text "Oth performed was successfully created"
    click_on "Back"
  end

  test "should update Oth performed" do
    visit oth_performed_url(@oth_performed)
    click_on "Edit this oth performed", match: :first

    fill_in "Integer", with: @oth_performed.integer
    check "Job current" if @oth_performed.job_current
    fill_in "Job done", with: @oth_performed.job_done
    fill_in "Job hr", with: @oth_performed.job_hr
    fill_in "Job min", with: @oth_performed.job_min
    fill_in "Job performed", with: @oth_performed.job_performed
    fill_in "Job reason", with: @oth_performed.job_reason
    click_on "Update Oth performed"

    assert_text "Oth performed was successfully updated"
    click_on "Back"
  end

  test "should destroy Oth performed" do
    visit oth_performed_url(@oth_performed)
    click_on "Destroy this oth performed", match: :first

    assert_text "Oth performed was successfully destroyed"
  end
end
