require "test_helper"

class OthPerformedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @oth_performed = oth_performeds(:one)
  end

  test "should get index" do
    get oth_performeds_url
    assert_response :success
  end

  test "should get new" do
    get new_oth_performed_url
    assert_response :success
  end

  test "should create oth_performed" do
    assert_difference("OthPerformed.count") do
      post oth_performeds_url, params: { oth_performed: { integer: @oth_performed.integer, job_current: @oth_performed.job_current, job_done: @oth_performed.job_done, job_hr: @oth_performed.job_hr, job_min: @oth_performed.job_min, job_performed: @oth_performed.job_performed, job_reason: @oth_performed.job_reason } }
    end

    assert_redirected_to oth_performed_url(OthPerformed.last)
  end

  test "should show oth_performed" do
    get oth_performed_url(@oth_performed)
    assert_response :success
  end

  test "should get edit" do
    get edit_oth_performed_url(@oth_performed)
    assert_response :success
  end

  test "should update oth_performed" do
    patch oth_performed_url(@oth_performed), params: { oth_performed: { integer: @oth_performed.integer, job_current: @oth_performed.job_current, job_done: @oth_performed.job_done, job_hr: @oth_performed.job_hr, job_min: @oth_performed.job_min, job_performed: @oth_performed.job_performed, job_reason: @oth_performed.job_reason } }
    assert_redirected_to oth_performed_url(@oth_performed)
  end

  test "should destroy oth_performed" do
    assert_difference("OthPerformed.count", -1) do
      delete oth_performed_url(@oth_performed)
    end

    assert_redirected_to oth_performeds_url
  end
end
