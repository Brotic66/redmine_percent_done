require_dependency 'redmine_percent_done'

Redmine::Plugin.register :redmine_percent_done do
  name 'Redmine Issue Done Ratio Plugin'
  url  'https://github.com/Brotic66/redmine_percent_done'

  description 'A fork from https://github.com/jkraemer/redmine_percent_done plugin by Jens Krämer : https://jkraemer.net/'

  author     'Brice VICO'
  author_url 'https://github.com/Brotic66'

  version '1.1.0'

  requires_redmine version_or_higher: '2.6.0'

  settings partial: 'settings/redmine_percent_done', default: {}
end

Rails.configuration.to_prepare do
  RedminePercentDone.setup
end

