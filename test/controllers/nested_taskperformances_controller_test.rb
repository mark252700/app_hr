require "test_helper"

class NestedTaskperformancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nested_taskperformance = nested_taskperformances(:one)
  end

  test "should get index" do
    get nested_taskperformances_url
    assert_response :success
  end

  test "should get new" do
    get new_nested_taskperformance_url
    assert_response :success
  end

  test "should create nested_taskperformance" do
    assert_difference("NestedTaskperformance.count") do
      post nested_taskperformances_url, params: { nested_taskperformance: { task_impact: @nested_taskperformance.task_impact, task_notdone: @nested_taskperformance.task_notdone, task_reason: @nested_taskperformance.task_reason } }
    end

    assert_redirected_to nested_taskperformance_url(NestedTaskperformance.last)
  end

  test "should show nested_taskperformance" do
    get nested_taskperformance_url(@nested_taskperformance)
    assert_response :success
  end

  test "should get edit" do
    get edit_nested_taskperformance_url(@nested_taskperformance)
    assert_response :success
  end

  test "should update nested_taskperformance" do
    patch nested_taskperformance_url(@nested_taskperformance), params: { nested_taskperformance: { task_impact: @nested_taskperformance.task_impact, task_notdone: @nested_taskperformance.task_notdone, task_reason: @nested_taskperformance.task_reason } }
    assert_redirected_to nested_taskperformance_url(@nested_taskperformance)
  end

  test "should destroy nested_taskperformance" do
    assert_difference("NestedTaskperformance.count", -1) do
      delete nested_taskperformance_url(@nested_taskperformance)
    end

    assert_redirected_to nested_taskperformances_url
  end
end
