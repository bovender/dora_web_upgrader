# frozen_string_literal: true

DoraWebUpgrader::Engine.routes.draw do
  post 'upgrade' => 'upgrade#upgrade'
end
