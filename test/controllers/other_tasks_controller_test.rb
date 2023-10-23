require "test_helper"

class OtherTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @other_task = other_tasks(:one)
  end

  test "should get index" do
    get other_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_other_task_url
    assert_response :success
  end

  test "should create other_task" do
    assert_difference("OtherTask.count") do
      post other_tasks_url, params: { other_task: { task_impact: @other_task.task_impact, task_notdone: @other_task.task_notdone, task_reason: @other_task.task_reason } }
    end

    assert_redirected_to other_task_url(OtherTask.last)
  end

  test "should show other_task" do
    get other_task_url(@other_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_other_task_url(@other_task)
    assert_response :success
  end

  test "should update other_task" do
    patch other_task_url(@other_task), params: { other_task: { task_impact: @other_task.task_impact, task_notdone: @other_task.task_notdone, task_reason: @other_task.task_reason } }
    assert_redirected_to other_task_url(@other_task)
  end

  test "should destroy other_task" do
    assert_difference("OtherTask.count", -1) do
      delete other_task_url(@other_task)
    end

    assert_redirected_to other_tasks_url
  end
end
