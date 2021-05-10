# frozen_string_literal: true

DoraWebUpgrader::Engine.routes.draw do
  scope '/dora_web_upgrader' do
    post 'upgrade' => 'upgrade#upgrade'
  end
end
