module DoraWebUpgrader
  # Sends an e-mail report of the upgrade process
  # This is invoked by Dora's upgrade-app.sh script via rails runner.
  class Reporter
    class << self
      def run(message, log_file)
        log = File.read(log_file).sanitize
        message = message.sanitize
        UpgradeMailer.upgrade_performed(message, log).deliver_now
      end

      private

      def sanitize(str)
        str.to_s.html_safe
      end
    end
  end
end
