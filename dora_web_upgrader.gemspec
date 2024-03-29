# frozen_string_literal: true

require_relative 'lib/dora_web_upgrader/version'

Gem::Specification.new do |spec|
  spec.name        = 'dora_web_upgrader'
  spec.version     = DoraWebUpgrader::VERSION
  spec.authors     = 'Daniel Kraus'
  spec.email       = 'bovender@bovender.de'
  spec.homepage    = 'https://github.com/bovender/dora_web_upgrader'
  spec.summary     = 'Dora Web Upgrader is a Rails engine that facilitates ' \
                     'upgrading a dora-powered Rails application via webhooks.'
  spec.description = 'Make use of web hooks that are triggered by pushing code ' \
                     'to a repository and have your application taking care of ' \
                     'upgrading itself.'
  spec.license     = 'MIT'
  spec.required_ruby_version = '>= 3.1'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md', 'CHANGELOG.md']

  spec.add_dependency 'rails', '>= 6.0', '< 8.0'
end
