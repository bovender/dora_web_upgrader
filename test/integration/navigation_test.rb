# frozen_string_literal: true

require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest
  test 'issue a POST request with invalid secret' do
    post '/dora_web_upgrader/upgrade',
         params: '{ "secret": "invalid" }'
    assert_response :success
    assert_equal '{"message":"invalid secret"}', response.body
  end

  test 'issue a POST request with valid secret' do
    post '/dora_web_upgrader/upgrade',
         params: "{ \"secret\": \"#{DoraWebUpgrader.config.secret}\" }"
    assert_response :success
    assert_equal '{"message":"ok"}', response.body
  end
end
