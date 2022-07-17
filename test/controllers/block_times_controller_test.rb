require "test_helper"

class BlockTimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @block_time = block_times(:one)
  end

  test "should get index" do
    get block_times_url
    assert_response :success
  end

  test "should get new" do
    get new_block_time_url
    assert_response :success
  end

  test "should create block_time" do
    assert_difference("BlockTime.count") do
      post block_times_url, params: { block_time: { end: @block_time.end, start: @block_time.start } }
    end

    assert_redirected_to block_time_url(BlockTime.last)
  end

  test "should show block_time" do
    get block_time_url(@block_time)
    assert_response :success
  end

  test "should get edit" do
    get edit_block_time_url(@block_time)
    assert_response :success
  end

  test "should update block_time" do
    patch block_time_url(@block_time), params: { block_time: { end: @block_time.end, start: @block_time.start } }
    assert_redirected_to block_time_url(@block_time)
  end

  test "should destroy block_time" do
    assert_difference("BlockTime.count", -1) do
      delete block_time_url(@block_time)
    end

    assert_redirected_to block_times_url
  end
end
