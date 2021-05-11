# frozen_string_literal: true

# Configure DoraWebUpgrader <https://github.com/bovender/DoraWebUpgrader>
DoraWebUpgrader.configure do |config|
  # Sender address for upgrade notifications.
  # Make sure that this is a valid address that is accepted by the mail server
  # that is configured for the current application.
  config.email_notifications_from = 'webmaster'

  # Recipient address for upgrade notifications.
  # Make sure that this is a valid address that is accepted by the mail server
  # that is configured for the current application.
  config.email_notifications_to = 'webmaster'

  # A secret string that must be included in the POST request to the API
  # endpoint. If this is an empty string, the upgrader will raise an error.
  config.secret = ENV['DORA_WEB_UPGRADER_SECRET']
end
