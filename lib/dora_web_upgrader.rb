# frozen_string_literal: true

require 'dora_web_upgrader/version'
require 'dora_web_upgrader/engine'
require 'dora_web_upgrader/configuration'

module DoraWebUpgrader
  mattr_accessor :secret

  class << self
    attr_reader :config

    def configure
      @config = Configuration.new
      yield config
    end
  end
end
