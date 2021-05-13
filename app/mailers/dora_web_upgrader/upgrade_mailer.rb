# frozen_string_literal: true

module DoraWebUpgrader
  class UpgradeMailer < ApplicationMailer
    def upgrade_started(message, payload)
      @message = message
      @payload = payload.gsub(/("secret"\s*:\s*)"[^"]+"/, '\1"(REDACTED)"')
      mail subject: "[#{app_identifier} #{Rails.env}] upgrade started"
    end

    def upgrade_performed(output, result)
      @output = output
      s = case result
          when -1
            'dry run'
          when 0
            'succeeded'
          else
            'failed'
          end
      mail subject: "[#{app_identifier} #{Rails.env}] upgrade #{s}"
    end

    private

    def app_identifier
      ::Rails.application.class.module_parent
    end
  end
end
