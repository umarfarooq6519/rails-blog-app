# -*- encoding: utf-8 -*-
# stub: hotwire-livereload 2.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "hotwire-livereload".freeze
  s.version = "2.0.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Kirill Platonov".freeze]
  s.date = "2024-12-26"
  s.email = ["mail@kirillplatonov.com".freeze]
  s.homepage = "https://github.com/kirillplatonov/hotwire-livereload".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.4.20".freeze
  s.summary = "Automatically reload Hotwire Turbo when app files are modified.".freeze

  s.installed_by_version = "3.6.9".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<railties>.freeze, [">= 7.0.0".freeze])
  s.add_runtime_dependency(%q<actioncable>.freeze, [">= 7.0.0".freeze])
  s.add_runtime_dependency(%q<listen>.freeze, [">= 3.0.0".freeze])
end
