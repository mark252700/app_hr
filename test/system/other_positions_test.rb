require "application_system_test_case"

class OtherPositionsTest < ApplicationSystemTestCase
  setup do
    @other_position = other_positions(:one)
  end

  test "visiting the index" do
    visit other_positions_url
    assert_selector "h1", text: "Other positions"
  end

  test "should create other position" do
    visit other_positions_url
    click_on "New other position"

    fill_in "Pos month", with: @other_position.pos_month
    fill_in "Pos title", with: @other_position.pos_title
    fill_in "Pos yr", with: @other_position.pos_yr
    click_on "Create Other position"

    assert_text "Other position was successfully created"
    click_on "Back"
  end

  test "should update Other position" do
    visit other_position_url(@other_position)
    click_on "Edit this other position", match: :first

    fill_in "Pos month", with: @other_position.pos_month
    fill_in "Pos title", with: @other_position.pos_title
    fill_in "Pos yr", with: @other_position.pos_yr
    click_on "Update Other position"

    assert_text "Other position was successfully updated"
    click_on "Back"
  end

  test "should destroy Other position" do
    visit other_position_url(@other_position)
    click_on "Destroy this other position", match: :first

    assert_text "Other position was successfully destroyed"
  end
end
