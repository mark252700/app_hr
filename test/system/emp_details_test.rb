require "application_system_test_case"

class EmpDetailsTest < ApplicationSystemTestCase
  setup do
    @emp_detail = emp_details(:one)
  end

  test "visiting the index" do
    visit emp_details_url
    assert_selector "h1", text: "Emp details"
  end

  test "should create emp detail" do
    visit emp_details_url
    click_on "New emp detail"

    fill_in "Break", with: @emp_detail.break
    fill_in "Contact", with: @emp_detail.contact
    fill_in "Department", with: @emp_detail.department
    fill_in "Division", with: @emp_detail.division
    fill_in "Educ certificate", with: @emp_detail.educ_certificate
    fill_in "Educ course", with: @emp_detail.educ_course
    fill_in "Educ grad", with: @emp_detail.educ_grad
    fill_in "Educ othskill", with: @emp_detail.educ_othskill
    fill_in "Educ skill", with: @emp_detail.educ_skill
    fill_in "Emp", with: @emp_detail.emp_id
    fill_in "Fullname", with: @emp_detail.fullname
    fill_in "Hr perday", with: @emp_detail.hr_perday
    fill_in "Hr perweek", with: @emp_detail.hr_perweek
    fill_in "Launch", with: @emp_detail.launch
    check "Ot weekday" if @emp_detail.ot_weekday
    check "Ot weekend" if @emp_detail.ot_weekend
    fill_in "Pos title", with: @emp_detail.pos_title
    fill_in "Rank", with: @emp_detail.rank
    fill_in "Ser month", with: @emp_detail.ser_month
    fill_in "Ser year", with: @emp_detail.ser_year
    fill_in "Sup name", with: @emp_detail.sup_name
    fill_in "Sup title", with: @emp_detail.sup_title
    fill_in "Workday", with: @emp_detail.workday
    click_on "Create Emp detail"

    assert_text "Emp detail was successfully created"
    click_on "Back"
  end

  test "should update Emp detail" do
    visit emp_detail_url(@emp_detail)
    click_on "Edit this emp detail", match: :first

    fill_in "Break", with: @emp_detail.break
    fill_in "Contact", with: @emp_detail.contact
    fill_in "Department", with: @emp_detail.department
    fill_in "Division", with: @emp_detail.division
    fill_in "Educ certificate", with: @emp_detail.educ_certificate
    fill_in "Educ course", with: @emp_detail.educ_course
    fill_in "Educ grad", with: @emp_detail.educ_grad
    fill_in "Educ othskill", with: @emp_detail.educ_othskill
    fill_in "Educ skill", with: @emp_detail.educ_skill
    fill_in "Emp", with: @emp_detail.emp_id
    fill_in "Fullname", with: @emp_detail.fullname
    fill_in "Hr perday", with: @emp_detail.hr_perday
    fill_in "Hr perweek", with: @emp_detail.hr_perweek
    fill_in "Launch", with: @emp_detail.launch
    check "Ot weekday" if @emp_detail.ot_weekday
    check "Ot weekend" if @emp_detail.ot_weekend
    fill_in "Pos title", with: @emp_detail.pos_title
    fill_in "Rank", with: @emp_detail.rank
    fill_in "Ser month", with: @emp_detail.ser_month
    fill_in "Ser year", with: @emp_detail.ser_year
    fill_in "Sup name", with: @emp_detail.sup_name
    fill_in "Sup title", with: @emp_detail.sup_title
    fill_in "Workday", with: @emp_detail.workday
    click_on "Update Emp detail"

    assert_text "Emp detail was successfully updated"
    click_on "Back"
  end

  test "should destroy Emp detail" do
    visit emp_detail_url(@emp_detail)
    click_on "Destroy this emp detail", match: :first

    assert_text "Emp detail was successfully destroyed"
  end
end
