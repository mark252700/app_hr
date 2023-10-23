require "test_helper"

class NestedOthperformesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nested_othperforme = nested_othperformes(:one)
  end

  test "should get index" do
    get nested_othperformes_url
    assert_response :success
  end

  test "should get new" do
    get new_nested_othperforme_url
    assert_response :success
  end

  test "should create nested_othperforme" do
    assert_difference("NestedOthperforme.count") do
      post nested_othperformes_url, params: { nested_othperforme: { job_current: @nested_othperforme.job_current, job_done: @nested_othperforme.job_done, job_hr: @nested_othperforme.job_hr, job_min: @nested_othperforme.job_min, job_performed: @nested_othperforme.job_performed, job_reason: @nested_othperforme.job_reason } }
    end

    assert_redirected_to nested_othperforme_url(NestedOthperforme.last)
  end

  test "should show nested_othperforme" do
    get nested_othperforme_url(@nested_othperforme)
    assert_response :success
  end

  test "should get edit" do
    get edit_nested_othperforme_url(@nested_othperforme)
    assert_response :success
  end

  test "should update nested_othperforme" do
    patch nested_othperforme_url(@nested_othperforme), params: { nested_othperforme: { job_current: @nested_othperforme.job_current, job_done: @nested_othperforme.job_done, job_hr: @nested_othperforme.job_hr, job_min: @nested_othperforme.job_min, job_performed: @nested_othperforme.job_performed, job_reason: @nested_othperforme.job_reason } }
    assert_redirected_to nested_othperforme_url(@nested_othperforme)
  end

  test "should destroy nested_othperforme" do
    assert_difference("NestedOthperforme.count", -1) do
      delete nested_othperforme_url(@nested_othperforme)
    end

    assert_redirected_to nested_othperformes_url
  end
end
