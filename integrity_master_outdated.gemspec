Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=

  s.name              = 'integrity_master_outdated'
  s.version           = '0.0.9'
  s.date              = '2012-08-22'

  s.summary     = 'Indicators of freshness of rebase target at build time'
  s.description = 'Provides a HTTP endpoint to show if master has changed (and the build is outdated) for projects in IntegrityCI.'

  s.authors  = ['xtoddx']
  s.email    = 'xtoddx@gmail.com'
  s.homepage = 'http://github.com/CirrusMio/integrity_master_outdated'

  s.require_paths = %w[lib]

  # 1.2.0 exposed last_modified to send_file
  s.add_dependency('sinatra', '> 1.2.0')

  s.files = `git ls-files`.split("\n")
end
