# frozen_string_literal: true

module DoraWebUpgrader
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc 'Install DoraWebUpgrader sample configuration'
      source_root File.expand_path('/templates', __DIR__)

      def copy_config
        template 'config/initializers/dora_web_upgrader.rb'
      end
    end
  end
end
