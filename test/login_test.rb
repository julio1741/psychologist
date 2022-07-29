# frozen_string_literal: true

require "test_helper"

class LoginTest < ActionDispatch::IntegrationTest
  fixtures :users

  test "login with valid credentials" do
    get "/login"
    assert_equal 200, status
    login(:maria, 'maria')
    follow_redirect!
    assert_equal 200, status
    assert_equal "/", path
  end

  test "login with wrong credentials" do
    get "/login"
    assert_equal 200, status
    login(:julio, 'juliooo')
    assert_equal "/login", path
    assert_select "p", "Sorry, your username or password was incorrect"
  end

  private

  def login(user, password)
    user = users(user)
    # post the login and follow through to the home page
    post "/login", params: { user: { username: user.username, password: password } }
  end
end
