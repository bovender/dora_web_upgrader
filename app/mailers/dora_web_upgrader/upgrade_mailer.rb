# frozen_string_literal: true

module DoraWebUpgrader
  class UpgradeMailer < ApplicationMailer

    def upgrade_started(message, payload)
      @message = message
      @payload = payload
      mail from: WEBMASTER, to: WEBMASTER, subject: "[GGAP] [#{Rails.env}] Webhook received"
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
      mail from: WEBMASTER, to: WEBMASTER, subject: "[GGAP] [#{Rails.env}] Upgrade #{s}"
    end
  end
end
