require "application_system_test_case"

class RelTrainingsTest < ApplicationSystemTestCase
  setup do
    @rel_training = rel_trainings(:one)
  end

  test "visiting the index" do
    visit rel_trainings_url
    assert_selector "h1", text: "Rel trainings"
  end

  test "should create rel training" do
    visit rel_trainings_url
    click_on "New rel training"

    fill_in "Train benefit", with: @rel_training.train_benefit
    fill_in "Train type", with: @rel_training.train_type
    click_on "Create Rel training"

    assert_text "Rel training was successfully created"
    click_on "Back"
  end

  test "should update Rel training" do
    visit rel_training_url(@rel_training)
    click_on "Edit this rel training", match: :first

    fill_in "Train benefit", with: @rel_training.train_benefit
    fill_in "Train type", with: @rel_training.train_type
    click_on "Update Rel training"

    assert_text "Rel training was successfully updated"
    click_on "Back"
  end

  test "should destroy Rel training" do
    visit rel_training_url(@rel_training)
    click_on "Destroy this rel training", match: :first

    assert_text "Rel training was successfully destroyed"
  end
end
