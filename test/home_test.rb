# frozen_string_literal: true

require 'test_helper'

class HomeTest < ActionDispatch::IntegrationTest
  test 'can see the welcome page' do
    get '/'
    assert_select 'h1', 'Welcome to Psychologist Scheduller'
  end
end
