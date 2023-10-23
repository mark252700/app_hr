require "test_helper"

class TaskPerfomancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task_perfomance = task_perfomances(:one)
  end

  test "should get index" do
    get task_perfomances_url
    assert_response :success
  end

  test "should get new" do
    get new_task_perfomance_url
    assert_response :success
  end

  test "should create task_perfomance" do
    assert_difference("TaskPerfomance.count") do
      post task_perfomances_url, params: { task_perfomance: { task_impact: @task_perfomance.task_impact, task_notdone: @task_perfomance.task_notdone, task_reason: @task_perfomance.task_reason } }
    end

    assert_redirected_to task_perfomance_url(TaskPerfomance.last)
  end

  test "should show task_perfomance" do
    get task_perfomance_url(@task_perfomance)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_perfomance_url(@task_perfomance)
    assert_response :success
  end

  test "should update task_perfomance" do
    patch task_perfomance_url(@task_perfomance), params: { task_perfomance: { task_impact: @task_perfomance.task_impact, task_notdone: @task_perfomance.task_notdone, task_reason: @task_perfomance.task_reason } }
    assert_redirected_to task_perfomance_url(@task_perfomance)
  end

  test "should destroy task_perfomance" do
    assert_difference("TaskPerfomance.count", -1) do
      delete task_perfomance_url(@task_perfomance)
    end

    assert_redirected_to task_perfomances_url
  end
end
