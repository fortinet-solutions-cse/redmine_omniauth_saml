require 'redmine'
require File.expand_path('lib/redmine_omni_auth_saml.rb', __dir__)
require File.expand_path('lib/redmine_omni_auth_saml/hooks.rb', __dir__)
require File.expand_path('lib/redmine_omni_auth_saml/user_patch.rb', __dir__)


# Patches to existing classes/modules
ActiveSupport::Reloader.to_prepare do
  require_dependency 'redmine_omni_auth_saml/account_helper_patch'
  require_dependency 'redmine_omni_auth_saml/account_controller_patch'
end

# Plugin generic informations
Redmine::Plugin.register :redmine_omniauth_saml do
  name 'Redmine Omniauth SAML plugin'
  description 'This plugin adds Omniauth SAML support to Redmine. Based in Omniauth CAS plugin'
  author 'Christian A. Rodriguez'
  author_url 'mailto:car@cespi.unlp.edu.ar'
  url 'https://github.com/chrodriguez/redmine_omniauth_saml'
  version '0.0.1'
  requires_redmine :version_or_higher => '2.3.0'
  settings :default => { 'enabled' => 'true', 'label_login_with_saml' => '', 'replace_redmine_login' => false  },
           :partial => 'settings/omniauth_saml_settings'
end

