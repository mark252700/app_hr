require "test_helper"

class OthTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @oth_task = oth_tasks(:one)
  end

  test "should get index" do
    get oth_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_oth_task_url
    assert_response :success
  end

  test "should create oth_task" do
    assert_difference("OthTask.count") do
      post oth_tasks_url, params: { oth_task: { oth_impact: @oth_task.oth_impact, oth_reason: @oth_task.oth_reason, oth_tasknotdone: @oth_task.oth_tasknotdone } }
    end

    assert_redirected_to oth_task_url(OthTask.last)
  end

  test "should show oth_task" do
    get oth_task_url(@oth_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_oth_task_url(@oth_task)
    assert_response :success
  end

  test "should update oth_task" do
    patch oth_task_url(@oth_task), params: { oth_task: { oth_impact: @oth_task.oth_impact, oth_reason: @oth_task.oth_reason, oth_tasknotdone: @oth_task.oth_tasknotdone } }
    assert_redirected_to oth_task_url(@oth_task)
  end

  test "should destroy oth_task" do
    assert_difference("OthTask.count", -1) do
      delete oth_task_url(@oth_task)
    end

    assert_redirected_to oth_tasks_url
  end
end
