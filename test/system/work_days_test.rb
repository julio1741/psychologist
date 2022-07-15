require "application_system_test_case"

class WorkDaysTest < ApplicationSystemTestCase
  setup do
    @work_day = work_days(:one)
  end

  test "visiting the index" do
    visit work_days_url
    assert_selector "h1", text: "Work days"
  end

  test "should create work day" do
    visit work_days_url
    click_on "New work day"

    fill_in "Day number", with: @work_day.day_number
    fill_in "Name", with: @work_day.name
    click_on "Create Work day"

    assert_text "Work day was successfully created"
    click_on "Back"
  end

  test "should update Work day" do
    visit work_day_url(@work_day)
    click_on "Edit this work day", match: :first

    fill_in "Day number", with: @work_day.day_number
    fill_in "Name", with: @work_day.name
    click_on "Update Work day"

    assert_text "Work day was successfully updated"
    click_on "Back"
  end

  test "should destroy Work day" do
    visit work_day_url(@work_day)
    click_on "Destroy this work day", match: :first

    assert_text "Work day was successfully destroyed"
  end
end
