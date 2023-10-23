require "application_system_test_case"

class OtherTasksTest < ApplicationSystemTestCase
  setup do
    @other_task = other_tasks(:one)
  end

  test "visiting the index" do
    visit other_tasks_url
    assert_selector "h1", text: "Other tasks"
  end

  test "should create other task" do
    visit other_tasks_url
    click_on "New other task"

    fill_in "Task impact", with: @other_task.task_impact
    fill_in "Task notdone", with: @other_task.task_notdone
    fill_in "Task reason", with: @other_task.task_reason
    click_on "Create Other task"

    assert_text "Other task was successfully created"
    click_on "Back"
  end

  test "should update Other task" do
    visit other_task_url(@other_task)
    click_on "Edit this other task", match: :first

    fill_in "Task impact", with: @other_task.task_impact
    fill_in "Task notdone", with: @other_task.task_notdone
    fill_in "Task reason", with: @other_task.task_reason
    click_on "Update Other task"

    assert_text "Other task was successfully updated"
    click_on "Back"
  end

  test "should destroy Other task" do
    visit other_task_url(@other_task)
    click_on "Destroy this other task", match: :first

    assert_text "Other task was successfully destroyed"
  end
end
