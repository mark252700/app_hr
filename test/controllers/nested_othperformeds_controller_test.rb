require "test_helper"

class NestedOthperformedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nested_othperformed = nested_othperformeds(:one)
  end

  test "should get index" do
    get nested_othperformeds_url
    assert_response :success
  end

  test "should get new" do
    get new_nested_othperformed_url
    assert_response :success
  end

  test "should create nested_othperformed" do
    assert_difference("NestedOthperformed.count") do
      post nested_othperformeds_url, params: { nested_othperformed: { job_current: @nested_othperformed.job_current, job_done: @nested_othperformed.job_done, job_hr: @nested_othperformed.job_hr, job_min: @nested_othperformed.job_min, job_performed: @nested_othperformed.job_performed, job_reason: @nested_othperformed.job_reason } }
    end

    assert_redirected_to nested_othperformed_url(NestedOthperformed.last)
  end

  test "should show nested_othperformed" do
    get nested_othperformed_url(@nested_othperformed)
    assert_response :success
  end

  test "should get edit" do
    get edit_nested_othperformed_url(@nested_othperformed)
    assert_response :success
  end

  test "should update nested_othperformed" do
    patch nested_othperformed_url(@nested_othperformed), params: { nested_othperformed: { job_current: @nested_othperformed.job_current, job_done: @nested_othperformed.job_done, job_hr: @nested_othperformed.job_hr, job_min: @nested_othperformed.job_min, job_performed: @nested_othperformed.job_performed, job_reason: @nested_othperformed.job_reason } }
    assert_redirected_to nested_othperformed_url(@nested_othperformed)
  end

  test "should destroy nested_othperformed" do
    assert_difference("NestedOthperformed.count", -1) do
      delete nested_othperformed_url(@nested_othperformed)
    end

    assert_redirected_to nested_othperformeds_url
  end
end
