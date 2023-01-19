# frozen_string_literal: true

module DoraWebUpgrader
  class UpgradeController < ApplicationController
    protect_from_forgery with: :null_session
    layout false

    def upgrade
      secret = DoraWebUpgrader.config.secret
      raise 'DoraWebUpgrader.config.secret is not configured!' if secret.blank?

      @payload = JSON.parse(request.raw_post)
      ok = @payload['secret'] == secret
      @message = ok ? 'ok' : 'invalid secret'
      UpgradeMailer.upgrade_started(@message, @payload).deliver_now
      UpgradeJob.perform_now if ok
      render json: { message: @message }
    end
  end
end
