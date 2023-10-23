require "test_helper"

class TaskperformancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @taskperformance = taskperformances(:one)
  end

  test "should get index" do
    get taskperformances_url
    assert_response :success
  end

  test "should get new" do
    get new_taskperformance_url
    assert_response :success
  end

  test "should create taskperformance" do
    assert_difference("Taskperformance.count") do
      post taskperformances_url, params: { taskperformance: { task_impact: @taskperformance.task_impact, task_notdone: @taskperformance.task_notdone, task_reason: @taskperformance.task_reason } }
    end

    assert_redirected_to taskperformance_url(Taskperformance.last)
  end

  test "should show taskperformance" do
    get taskperformance_url(@taskperformance)
    assert_response :success
  end

  test "should get edit" do
    get edit_taskperformance_url(@taskperformance)
    assert_response :success
  end

  test "should update taskperformance" do
    patch taskperformance_url(@taskperformance), params: { taskperformance: { task_impact: @taskperformance.task_impact, task_notdone: @taskperformance.task_notdone, task_reason: @taskperformance.task_reason } }
    assert_redirected_to taskperformance_url(@taskperformance)
  end

  test "should destroy taskperformance" do
    assert_difference("Taskperformance.count", -1) do
      delete taskperformance_url(@taskperformance)
    end

    assert_redirected_to taskperformances_url
  end
end
