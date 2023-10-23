require "application_system_test_case"

class NotrelTrainingsTest < ApplicationSystemTestCase
  setup do
    @notrel_training = notrel_trainings(:one)
  end

  test "visiting the index" do
    visit notrel_trainings_url
    assert_selector "h1", text: "Notrel trainings"
  end

  test "should create notrel training" do
    visit notrel_trainings_url
    click_on "New notrel training"

    fill_in "Train benefit", with: @notrel_training.train_benefit
    fill_in "Train type", with: @notrel_training.train_type
    click_on "Create Notrel training"

    assert_text "Notrel training was successfully created"
    click_on "Back"
  end

  test "should update Notrel training" do
    visit notrel_training_url(@notrel_training)
    click_on "Edit this notrel training", match: :first

    fill_in "Train benefit", with: @notrel_training.train_benefit
    fill_in "Train type", with: @notrel_training.train_type
    click_on "Update Notrel training"

    assert_text "Notrel training was successfully updated"
    click_on "Back"
  end

  test "should destroy Notrel training" do
    visit notrel_training_url(@notrel_training)
    click_on "Destroy this notrel training", match: :first

    assert_text "Notrel training was successfully destroyed"
  end
end
