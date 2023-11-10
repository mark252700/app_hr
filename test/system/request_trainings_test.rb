require "application_system_test_case"

class RequestTrainingsTest < ApplicationSystemTestCase
  setup do
    @request_training = request_trainings(:one)
  end

  test "visiting the index" do
    visit request_trainings_url
    assert_selector "h1", text: "Request trainings"
  end

  test "should create request training" do
    visit request_trainings_url
    click_on "New request training"

    fill_in "Train benefit", with: @request_training.train_benefit
    fill_in "Train type", with: @request_training.train_type
    click_on "Create Request training"

    assert_text "Request training was successfully created"
    click_on "Back"
  end

  test "should update Request training" do
    visit request_training_url(@request_training)
    click_on "Edit this request training", match: :first

    fill_in "Train benefit", with: @request_training.train_benefit
    fill_in "Train type", with: @request_training.train_type
    click_on "Update Request training"

    assert_text "Request training was successfully updated"
    click_on "Back"
  end

  test "should destroy Request training" do
    visit request_training_url(@request_training)
    click_on "Destroy this request training", match: :first

    assert_text "Request training was successfully destroyed"
  end
end
