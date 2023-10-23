require "application_system_test_case"

class ReqTrainingsTest < ApplicationSystemTestCase
  setup do
    @req_training = req_trainings(:one)
  end

  test "visiting the index" do
    visit req_trainings_url
    assert_selector "h1", text: "Req trainings"
  end

  test "should create req training" do
    visit req_trainings_url
    click_on "New req training"

    fill_in "Sup name", with: @req_training.sup_name
    fill_in "Sup title", with: @req_training.sup_title
    fill_in "Train benefit", with: @req_training.train_benefit
    fill_in "Train type", with: @req_training.train_type
    click_on "Create Req training"

    assert_text "Req training was successfully created"
    click_on "Back"
  end

  test "should update Req training" do
    visit req_training_url(@req_training)
    click_on "Edit this req training", match: :first

    fill_in "Sup name", with: @req_training.sup_name
    fill_in "Sup title", with: @req_training.sup_title
    fill_in "Train benefit", with: @req_training.train_benefit
    fill_in "Train type", with: @req_training.train_type
    click_on "Update Req training"

    assert_text "Req training was successfully updated"
    click_on "Back"
  end

  test "should destroy Req training" do
    visit req_training_url(@req_training)
    click_on "Destroy this req training", match: :first

    assert_text "Req training was successfully destroyed"
  end
end
