require "application_system_test_case"

class NestedTaskperformancesTest < ApplicationSystemTestCase
  setup do
    @nested_taskperformance = nested_taskperformances(:one)
  end

  test "visiting the index" do
    visit nested_taskperformances_url
    assert_selector "h1", text: "Nested taskperformances"
  end

  test "should create nested taskperformance" do
    visit nested_taskperformances_url
    click_on "New nested taskperformance"

    fill_in "Task impact", with: @nested_taskperformance.task_impact
    fill_in "Task notdone", with: @nested_taskperformance.task_notdone
    fill_in "Task reason", with: @nested_taskperformance.task_reason
    click_on "Create Nested taskperformance"

    assert_text "Nested taskperformance was successfully created"
    click_on "Back"
  end

  test "should update Nested taskperformance" do
    visit nested_taskperformance_url(@nested_taskperformance)
    click_on "Edit this nested taskperformance", match: :first

    fill_in "Task impact", with: @nested_taskperformance.task_impact
    fill_in "Task notdone", with: @nested_taskperformance.task_notdone
    fill_in "Task reason", with: @nested_taskperformance.task_reason
    click_on "Update Nested taskperformance"

    assert_text "Nested taskperformance was successfully updated"
    click_on "Back"
  end

  test "should destroy Nested taskperformance" do
    visit nested_taskperformance_url(@nested_taskperformance)
    click_on "Destroy this nested taskperformance", match: :first

    assert_text "Nested taskperformance was successfully destroyed"
  end
end
