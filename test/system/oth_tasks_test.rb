require "application_system_test_case"

class OthTasksTest < ApplicationSystemTestCase
  setup do
    @oth_task = oth_tasks(:one)
  end

  test "visiting the index" do
    visit oth_tasks_url
    assert_selector "h1", text: "Oth tasks"
  end

  test "should create oth task" do
    visit oth_tasks_url
    click_on "New oth task"

    fill_in "Oth impact", with: @oth_task.oth_impact
    fill_in "Oth reason", with: @oth_task.oth_reason
    fill_in "Oth tasknotdone", with: @oth_task.oth_tasknotdone
    click_on "Create Oth task"

    assert_text "Oth task was successfully created"
    click_on "Back"
  end

  test "should update Oth task" do
    visit oth_task_url(@oth_task)
    click_on "Edit this oth task", match: :first

    fill_in "Oth impact", with: @oth_task.oth_impact
    fill_in "Oth reason", with: @oth_task.oth_reason
    fill_in "Oth tasknotdone", with: @oth_task.oth_tasknotdone
    click_on "Update Oth task"

    assert_text "Oth task was successfully updated"
    click_on "Back"
  end

  test "should destroy Oth task" do
    visit oth_task_url(@oth_task)
    click_on "Destroy this oth task", match: :first

    assert_text "Oth task was successfully destroyed"
  end
end
