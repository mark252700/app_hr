require "test_helper"

class OtherTaskperformancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @other_taskperformance = other_taskperformances(:one)
  end

  test "should get index" do
    get other_taskperformances_url
    assert_response :success
  end

  test "should get new" do
    get new_other_taskperformance_url
    assert_response :success
  end

  test "should create other_taskperformance" do
    assert_difference("OtherTaskperformance.count") do
      post other_taskperformances_url, params: { other_taskperformance: { task_impact: @other_taskperformance.task_impact, task_notdone: @other_taskperformance.task_notdone, task_reason: @other_taskperformance.task_reason } }
    end

    assert_redirected_to other_taskperformance_url(OtherTaskperformance.last)
  end

  test "should show other_taskperformance" do
    get other_taskperformance_url(@other_taskperformance)
    assert_response :success
  end

  test "should get edit" do
    get edit_other_taskperformance_url(@other_taskperformance)
    assert_response :success
  end

  test "should update other_taskperformance" do
    patch other_taskperformance_url(@other_taskperformance), params: { other_taskperformance: { task_impact: @other_taskperformance.task_impact, task_notdone: @other_taskperformance.task_notdone, task_reason: @other_taskperformance.task_reason } }
    assert_redirected_to other_taskperformance_url(@other_taskperformance)
  end

  test "should destroy other_taskperformance" do
    assert_difference("OtherTaskperformance.count", -1) do
      delete other_taskperformance_url(@other_taskperformance)
    end

    assert_redirected_to other_taskperformances_url
  end
end
