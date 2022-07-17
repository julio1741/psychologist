require "application_system_test_case"

class BlockTimesTest < ApplicationSystemTestCase
  setup do
    @block_time = block_times(:one)
  end

  test "visiting the index" do
    visit block_times_url
    assert_selector "h1", text: "Block times"
  end

  test "should create block time" do
    visit block_times_url
    click_on "New block time"

    fill_in "End", with: @block_time.end
    fill_in "Start", with: @block_time.start
    click_on "Create Block time"

    assert_text "Block time was successfully created"
    click_on "Back"
  end

  test "should update Block time" do
    visit block_time_url(@block_time)
    click_on "Edit this block time", match: :first

    fill_in "End", with: @block_time.end
    fill_in "Start", with: @block_time.start
    click_on "Update Block time"

    assert_text "Block time was successfully updated"
    click_on "Back"
  end

  test "should destroy Block time" do
    visit block_time_url(@block_time)
    click_on "Destroy this block time", match: :first

    assert_text "Block time was successfully destroyed"
  end
end
