# frozen_string_literal: true

module DoraWebUpgrader
  class UpgradeController < ApplicationController
    layout false
    skip_forgery_protection

    def upgrade
      secret = DoraWebUpgrader.config.secret
      raise 'DoraWebUpgrader.secret is not configured!' if secret.blank?

      @payload = JSON.parse(request.raw_post)
      if @payload['secret'] == secret
        @message = 'ok'
        UpgradeJob.perform_later
      else
        @message = 'invalid secret'
      end

      UpgradeMailer.upgrade_started(@message, @payload).deliver_later

      render json: { message: @message }
    end
  end
end
