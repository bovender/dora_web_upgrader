# frozen_string_literal: true

# Configuration for the test suite
DoraWebUpgrader.configure do |config|
  config.email_notifications_to = 'to@example.com'
  config.email_notifications_from = 'from@example.com'
  config.secret = 'test_secret'
end
