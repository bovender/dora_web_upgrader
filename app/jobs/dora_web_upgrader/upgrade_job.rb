# frozen_string_literal: true

module DoraWebUpgrader
  class UpgradeJob < ApplicationJob
    queue_as :default

    def perform(*)
      # Do not upgrade developement environemnts as this might inadvertently
      # overwrite uncommitted changes.
      if %w[production staging].include? Rails.env
        logger.warn '******** DoraWebUpgrader: PERFORMING APPLICATION UPGRADE ********'
        exec "/usr/local/bin/upgrade-app.sh"
      else
        logger.warn "Rails environment: #{Rails.env} -- not upgrading..."
      end
    end
  end
end
