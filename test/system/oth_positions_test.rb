require "application_system_test_case"

class OthPositionsTest < ApplicationSystemTestCase
  setup do
    @oth_position = oth_positions(:one)
  end

  test "visiting the index" do
    visit oth_positions_url
    assert_selector "h1", text: "Oth positions"
  end

  test "should create oth position" do
    visit oth_positions_url
    click_on "New oth position"

    fill_in "Pos month", with: @oth_position.pos_month
    fill_in "Pos title", with: @oth_position.pos_title
    fill_in "Pos yr", with: @oth_position.pos_yr
    click_on "Create Oth position"

    assert_text "Oth position was successfully created"
    click_on "Back"
  end

  test "should update Oth position" do
    visit oth_position_url(@oth_position)
    click_on "Edit this oth position", match: :first

    fill_in "Pos month", with: @oth_position.pos_month
    fill_in "Pos title", with: @oth_position.pos_title
    fill_in "Pos yr", with: @oth_position.pos_yr
    click_on "Update Oth position"

    assert_text "Oth position was successfully updated"
    click_on "Back"
  end

  test "should destroy Oth position" do
    visit oth_position_url(@oth_position)
    click_on "Destroy this oth position", match: :first

    assert_text "Oth position was successfully destroyed"
  end
end
