# frozen_string_literal: true

module DoraWebUpgrader
  class UpgradeMailer < ApplicationMailer
    def upgrade_started(message, payload)
      @message = message
      @payload = payload
      @payload[:secret] = '(REDACTED)' if @payload[:secret]
      mail subject: "[#{app_identifier} #{Rails.env}] upgrade started"
    end

    def upgrade_performed(message, log)
      @message, @log = message, log
      mail subject: "[#{app_identifier} #{Rails.env}] upgrade: #{message}"
    end

    private

    def app_identifier
      ::Rails.application.class.module_parent
    end
  end
end
