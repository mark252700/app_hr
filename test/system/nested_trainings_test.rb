require "application_system_test_case"

class NestedTrainingsTest < ApplicationSystemTestCase
  setup do
    @nested_training = nested_trainings(:one)
  end

  test "visiting the index" do
    visit nested_trainings_url
    assert_selector "h1", text: "Nested trainings"
  end

  test "should create nested training" do
    visit nested_trainings_url
    click_on "New nested training"

    fill_in "Sup name", with: @nested_training.sup_name
    fill_in "Sup title", with: @nested_training.sup_title
    fill_in "Train benefit", with: @nested_training.train_benefit
    fill_in "Train type", with: @nested_training.train_type
    click_on "Create Nested training"

    assert_text "Nested training was successfully created"
    click_on "Back"
  end

  test "should update Nested training" do
    visit nested_training_url(@nested_training)
    click_on "Edit this nested training", match: :first

    fill_in "Sup name", with: @nested_training.sup_name
    fill_in "Sup title", with: @nested_training.sup_title
    fill_in "Train benefit", with: @nested_training.train_benefit
    fill_in "Train type", with: @nested_training.train_type
    click_on "Update Nested training"

    assert_text "Nested training was successfully updated"
    click_on "Back"
  end

  test "should destroy Nested training" do
    visit nested_training_url(@nested_training)
    click_on "Destroy this nested training", match: :first

    assert_text "Nested training was successfully destroyed"
  end
end
