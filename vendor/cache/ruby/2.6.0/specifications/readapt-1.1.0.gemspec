# -*- encoding: utf-8 -*-
# stub: readapt 1.1.0 ruby lib
# stub: ext/readapt/extconf.rb

Gem::Specification.new do |s|
  s.name = "readapt".freeze
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/castwide/readapt/blob/master/CHANGELOG.md", "homepage_uri" => "https://castwide.com", "source_code_uri" => "https://github.com/castwide/readapt" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Fred Snyder".freeze]
  s.bindir = "exe".freeze
  s.date = "2020-09-13"
  s.description = "Readapt is a Ruby debugger that natively supports the Debug Adapter Protocol. Features include next/step in/step out, local and global variable data, and individual thread control.".freeze
  s.email = ["fsnyder@castwide.com".freeze]
  s.executables = ["readapt".freeze]
  s.extensions = ["ext/readapt/extconf.rb".freeze]
  s.files = ["exe/readapt".freeze, "ext/readapt/extconf.rb".freeze]
  s.homepage = "https://castwide.com".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "A Ruby debugger for the Debug Adapter Protocol".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<backport>.freeze, ["~> 1.1"])
      s.add_runtime_dependency(%q<thor>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rake-compiler>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.14"])
    else
      s.add_dependency(%q<backport>.freeze, ["~> 1.1"])
      s.add_dependency(%q<thor>.freeze, ["~> 1.0"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rake-compiler>.freeze, ["~> 1.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<simplecov>.freeze, ["~> 0.14"])
    end
  else
    s.add_dependency(%q<backport>.freeze, ["~> 1.1"])
    s.add_dependency(%q<thor>.freeze, ["~> 1.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rake-compiler>.freeze, ["~> 1.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.14"])
  end
end
