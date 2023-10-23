require "application_system_test_case"

class TaskPerfomancesTest < ApplicationSystemTestCase
  setup do
    @task_perfomance = task_perfomances(:one)
  end

  test "visiting the index" do
    visit task_perfomances_url
    assert_selector "h1", text: "Task perfomances"
  end

  test "should create task perfomance" do
    visit task_perfomances_url
    click_on "New task perfomance"

    fill_in "Task impact", with: @task_perfomance.task_impact
    fill_in "Task notdone", with: @task_perfomance.task_notdone
    fill_in "Task reason", with: @task_perfomance.task_reason
    click_on "Create Task perfomance"

    assert_text "Task perfomance was successfully created"
    click_on "Back"
  end

  test "should update Task perfomance" do
    visit task_perfomance_url(@task_perfomance)
    click_on "Edit this task perfomance", match: :first

    fill_in "Task impact", with: @task_perfomance.task_impact
    fill_in "Task notdone", with: @task_perfomance.task_notdone
    fill_in "Task reason", with: @task_perfomance.task_reason
    click_on "Update Task perfomance"

    assert_text "Task perfomance was successfully updated"
    click_on "Back"
  end

  test "should destroy Task perfomance" do
    visit task_perfomance_url(@task_perfomance)
    click_on "Destroy this task perfomance", match: :first

    assert_text "Task perfomance was successfully destroyed"
  end
end
