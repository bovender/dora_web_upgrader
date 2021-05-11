# frozen_string_literal: true

module DoraWebUpgrader
  class ApplicationMailer < ActionMailer::Base
    default from: DoraWebUpgrader.config.email_notifications_from,
            to: DoraWebUpgrader.config.email_notifications_to,
            x_mailer: "#{engine_name} #{VERSION}"
  end
end
