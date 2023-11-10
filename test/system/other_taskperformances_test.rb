require "application_system_test_case"

class OtherTaskperformancesTest < ApplicationSystemTestCase
  setup do
    @other_taskperformance = other_taskperformances(:one)
  end

  test "visiting the index" do
    visit other_taskperformances_url
    assert_selector "h1", text: "Other taskperformances"
  end

  test "should create other taskperformance" do
    visit other_taskperformances_url
    click_on "New other taskperformance"

    fill_in "Task impact", with: @other_taskperformance.task_impact
    fill_in "Task notdone", with: @other_taskperformance.task_notdone
    fill_in "Task reason", with: @other_taskperformance.task_reason
    click_on "Create Other taskperformance"

    assert_text "Other taskperformance was successfully created"
    click_on "Back"
  end

  test "should update Other taskperformance" do
    visit other_taskperformance_url(@other_taskperformance)
    click_on "Edit this other taskperformance", match: :first

    fill_in "Task impact", with: @other_taskperformance.task_impact
    fill_in "Task notdone", with: @other_taskperformance.task_notdone
    fill_in "Task reason", with: @other_taskperformance.task_reason
    click_on "Update Other taskperformance"

    assert_text "Other taskperformance was successfully updated"
    click_on "Back"
  end

  test "should destroy Other taskperformance" do
    visit other_taskperformance_url(@other_taskperformance)
    click_on "Destroy this other taskperformance", match: :first

    assert_text "Other taskperformance was successfully destroyed"
  end
end
