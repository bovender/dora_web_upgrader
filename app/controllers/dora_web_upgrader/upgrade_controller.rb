# frozen_string_literal: true

module DoraWebUpgrader
  class UpgradeController < ApplicationController
    layout false
    skip_forgery_protection

    def upgrade
      secret = DoraWebUpgrader.secret
      raise 'DoraWebUpgrader.secret is not configured!' if secret.blank?

      @payload = JSON.parse(request.raw_post)
      if @payload.dig('secret') == secret
        @message = 'OK'
        UpgradeJob.perform_later
      else
        @message = 'Invalid secret'
      end

      UpgradeMailer.upgrade_started(@message, @payload).deliver_now
    end
  end
end
