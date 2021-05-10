# frozen_string_literal: true

module DoraWebUpgrader
  class UpgradeJob < ApplicationJob
    queue_as :default

    def perform(*)
      # Do not upgrade developement environemnts as this might inadvertently
      # overwrite uncommitted changes.
      if %w[production staging].include? Rails.env
        logger.warn '******** PERFORMING APPLICATION UPGRADE ********'
        output = `/usr/local/bin/upgrade-app.sh 2>&1`
        logger.warn output
        result = $CHILD_STATUS.exitstatus
      else
        output = "Rails environment: #{Rails.env} -- not upgrading..."
        logger.warn output
        result = -1
      end
      UpgradeMailer.upgrade_performed(output, result).deliver_now
    end
  end
end
