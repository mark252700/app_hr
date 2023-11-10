require "test_helper"

class OtherPerfromedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @other_perfromed = other_perfromeds(:one)
  end

  test "should get index" do
    get other_perfromeds_url
    assert_response :success
  end

  test "should get new" do
    get new_other_perfromed_url
    assert_response :success
  end

  test "should create other_perfromed" do
    assert_difference("OtherPerfromed.count") do
      post other_perfromeds_url, params: { other_perfromed: { job_current: @other_perfromed.job_current, job_done: @other_perfromed.job_done, job_hr: @other_perfromed.job_hr, job_min: @other_perfromed.job_min, job_performed: @other_perfromed.job_performed, job_reason: @other_perfromed.job_reason } }
    end

    assert_redirected_to other_perfromed_url(OtherPerfromed.last)
  end

  test "should show other_perfromed" do
    get other_perfromed_url(@other_perfromed)
    assert_response :success
  end

  test "should get edit" do
    get edit_other_perfromed_url(@other_perfromed)
    assert_response :success
  end

  test "should update other_perfromed" do
    patch other_perfromed_url(@other_perfromed), params: { other_perfromed: { job_current: @other_perfromed.job_current, job_done: @other_perfromed.job_done, job_hr: @other_perfromed.job_hr, job_min: @other_perfromed.job_min, job_performed: @other_perfromed.job_performed, job_reason: @other_perfromed.job_reason } }
    assert_redirected_to other_perfromed_url(@other_perfromed)
  end

  test "should destroy other_perfromed" do
    assert_difference("OtherPerfromed.count", -1) do
      delete other_perfromed_url(@other_perfromed)
    end

    assert_redirected_to other_perfromeds_url
  end
end
