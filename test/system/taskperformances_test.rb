require "application_system_test_case"

class TaskperformancesTest < ApplicationSystemTestCase
  setup do
    @taskperformance = taskperformances(:one)
  end

  test "visiting the index" do
    visit taskperformances_url
    assert_selector "h1", text: "Taskperformances"
  end

  test "should create taskperformance" do
    visit taskperformances_url
    click_on "New taskperformance"

    fill_in "Task impact", with: @taskperformance.task_impact
    fill_in "Task notdone", with: @taskperformance.task_notdone
    fill_in "Task reason", with: @taskperformance.task_reason
    click_on "Create Taskperformance"

    assert_text "Taskperformance was successfully created"
    click_on "Back"
  end

  test "should update Taskperformance" do
    visit taskperformance_url(@taskperformance)
    click_on "Edit this taskperformance", match: :first

    fill_in "Task impact", with: @taskperformance.task_impact
    fill_in "Task notdone", with: @taskperformance.task_notdone
    fill_in "Task reason", with: @taskperformance.task_reason
    click_on "Update Taskperformance"

    assert_text "Taskperformance was successfully updated"
    click_on "Back"
  end

  test "should destroy Taskperformance" do
    visit taskperformance_url(@taskperformance)
    click_on "Destroy this taskperformance", match: :first

    assert_text "Taskperformance was successfully destroyed"
  end
end
