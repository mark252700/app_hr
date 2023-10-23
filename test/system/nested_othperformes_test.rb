require "application_system_test_case"

class NestedOthperformesTest < ApplicationSystemTestCase
  setup do
    @nested_othperforme = nested_othperformes(:one)
  end

  test "visiting the index" do
    visit nested_othperformes_url
    assert_selector "h1", text: "Nested othperformes"
  end

  test "should create nested othperforme" do
    visit nested_othperformes_url
    click_on "New nested othperforme"

    check "Job current" if @nested_othperforme.job_current
    fill_in "Job done", with: @nested_othperforme.job_done
    fill_in "Job hr", with: @nested_othperforme.job_hr
    fill_in "Job min", with: @nested_othperforme.job_min
    fill_in "Job performed", with: @nested_othperforme.job_performed
    fill_in "Job reason", with: @nested_othperforme.job_reason
    click_on "Create Nested othperforme"

    assert_text "Nested othperforme was successfully created"
    click_on "Back"
  end

  test "should update Nested othperforme" do
    visit nested_othperforme_url(@nested_othperforme)
    click_on "Edit this nested othperforme", match: :first

    check "Job current" if @nested_othperforme.job_current
    fill_in "Job done", with: @nested_othperforme.job_done
    fill_in "Job hr", with: @nested_othperforme.job_hr
    fill_in "Job min", with: @nested_othperforme.job_min
    fill_in "Job performed", with: @nested_othperforme.job_performed
    fill_in "Job reason", with: @nested_othperforme.job_reason
    click_on "Update Nested othperforme"

    assert_text "Nested othperforme was successfully updated"
    click_on "Back"
  end

  test "should destroy Nested othperforme" do
    visit nested_othperforme_url(@nested_othperforme)
    click_on "Destroy this nested othperforme", match: :first

    assert_text "Nested othperforme was successfully destroyed"
  end
end
