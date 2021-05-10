Rails.application.routes.draw do
  mount DoraWebUpgrader::Engine => "/dora_web_upgrader"
end
