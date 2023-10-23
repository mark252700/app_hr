require "test_helper"

class JbPerformedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jb_performed = jb_performeds(:one)
  end

  test "should get index" do
    get jb_performeds_url
    assert_response :success
  end

  test "should get new" do
    get new_jb_performed_url
    assert_response :success
  end

  test "should create jb_performed" do
    assert_difference("JbPerformed.count") do
      post jb_performeds_url, params: { jb_performed: { job_current: @jb_performed.job_current, job_done: @jb_performed.job_done, job_hr: @jb_performed.job_hr, job_min: @jb_performed.job_min, job_performed: @jb_performed.job_performed, job_reason: @jb_performed.job_reason } }
    end

    assert_redirected_to jb_performed_url(JbPerformed.last)
  end

  test "should show jb_performed" do
    get jb_performed_url(@jb_performed)
    assert_response :success
  end

  test "should get edit" do
    get edit_jb_performed_url(@jb_performed)
    assert_response :success
  end

  test "should update jb_performed" do
    patch jb_performed_url(@jb_performed), params: { jb_performed: { job_current: @jb_performed.job_current, job_done: @jb_performed.job_done, job_hr: @jb_performed.job_hr, job_min: @jb_performed.job_min, job_performed: @jb_performed.job_performed, job_reason: @jb_performed.job_reason } }
    assert_redirected_to jb_performed_url(@jb_performed)
  end

  test "should destroy jb_performed" do
    assert_difference("JbPerformed.count", -1) do
      delete jb_performed_url(@jb_performed)
    end

    assert_redirected_to jb_performeds_url
  end
end
