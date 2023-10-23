require "test_helper"

class EmpDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @emp_detail = emp_details(:one)
  end

  test "should get index" do
    get emp_details_url
    assert_response :success
  end

  test "should get new" do
    get new_emp_detail_url
    assert_response :success
  end

  test "should create emp_detail" do
    assert_difference("EmpDetail.count") do
      post emp_details_url, params: { emp_detail: { break: @emp_detail.break, contact: @emp_detail.contact, department: @emp_detail.department, division: @emp_detail.division, educ_certificate: @emp_detail.educ_certificate, educ_course: @emp_detail.educ_course, educ_grad: @emp_detail.educ_grad, educ_othskill: @emp_detail.educ_othskill, educ_skill: @emp_detail.educ_skill, emp_id: @emp_detail.emp_id, fullname: @emp_detail.fullname, hr_perday: @emp_detail.hr_perday, hr_perweek: @emp_detail.hr_perweek, launch: @emp_detail.launch, ot_weekday: @emp_detail.ot_weekday, ot_weekend: @emp_detail.ot_weekend, pos_title: @emp_detail.pos_title, rank: @emp_detail.rank, ser_month: @emp_detail.ser_month, ser_year: @emp_detail.ser_year, sup_name: @emp_detail.sup_name, sup_title: @emp_detail.sup_title, workday: @emp_detail.workday } }
    end

    assert_redirected_to emp_detail_url(EmpDetail.last)
  end

  test "should show emp_detail" do
    get emp_detail_url(@emp_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_emp_detail_url(@emp_detail)
    assert_response :success
  end

  test "should update emp_detail" do
    patch emp_detail_url(@emp_detail), params: { emp_detail: { break: @emp_detail.break, contact: @emp_detail.contact, department: @emp_detail.department, division: @emp_detail.division, educ_certificate: @emp_detail.educ_certificate, educ_course: @emp_detail.educ_course, educ_grad: @emp_detail.educ_grad, educ_othskill: @emp_detail.educ_othskill, educ_skill: @emp_detail.educ_skill, emp_id: @emp_detail.emp_id, fullname: @emp_detail.fullname, hr_perday: @emp_detail.hr_perday, hr_perweek: @emp_detail.hr_perweek, launch: @emp_detail.launch, ot_weekday: @emp_detail.ot_weekday, ot_weekend: @emp_detail.ot_weekend, pos_title: @emp_detail.pos_title, rank: @emp_detail.rank, ser_month: @emp_detail.ser_month, ser_year: @emp_detail.ser_year, sup_name: @emp_detail.sup_name, sup_title: @emp_detail.sup_title, workday: @emp_detail.workday } }
    assert_redirected_to emp_detail_url(@emp_detail)
  end

  test "should destroy emp_detail" do
    assert_difference("EmpDetail.count", -1) do
      delete emp_detail_url(@emp_detail)
    end

    assert_redirected_to emp_details_url
  end
end
